import { GetServerSideProps } from "next";
import { connect } from "react-redux";
import * as React from "react";
import Link from "next/link";
import { verifyAuth } from "@actions/auth/AuthActions";
import { initializeStore } from "@state/useStore";
import { Layout } from "src/components/Layout";
import { User } from "types/User";
import lang from "../language.json";
import { State } from "types/State";
import { Seo } from "@components/Seo";
import { getCadInfo } from "@actions/global/GlobalActions";
import { useRouter } from "next/router";
interface Props {
  isAuth: boolean;
  user: User | null;
}

const IndexPage = ({ isAuth, user }: Props) => {
  const router = useRouter();

  React.useEffect(() => {
    if (isAuth === true) {
      router.push("/citizen");
    }
  }, [router, isAuth]);

  return (
    <Layout>
      <Seo />

      {isAuth ? (
        <>
          <h2>Welcome Back {user?.username}!</h2>
          <Link href="/citizen">
            <a className="btn btn-dark mb-2 w-100 p-2">Citizens Page</a>
          </Link>
        </>
      ) : (
        <>
          <Link href="/auth/login">
            <a className="btn btn-dark mb-2 w-100 p-2">{lang.auth.login}</a>
          </Link>
          <Link href="/auth/register">
            <a className="btn btn-dark w-100 p-2">{lang.auth.register}</a>
          </Link>
        </>
      )}

      <Credits />
    </Layout>
  );
};

const Credits: React.FC = () => {
  return (
    <div className="fixed-bottom text-light bg-dark border-dark px-3 pt-3 d-flex justify-content-between">
      <p>
        <a href="http://cosmic-systems.com/discord">Cosmic Systems</a> MDT | Thank you for choosing us!
      </p>
    </div>
  );
};

export const getServerSideProps: GetServerSideProps = async ({ req }) => {
  const store = initializeStore();
  await verifyAuth(req.headers)(store.dispatch);
  await getCadInfo(req.headers)(store.dispatch);

  return { props: { initialReduxState: store.getState() } };
};

const mapToProps = (state: State) => ({
  isAuth: state.auth.isAuth,
  user: state.auth.user,
});

export default connect(mapToProps)(IndexPage);
