Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4603491DB
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 11:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907101; cv=pass; b=jd+ulDe54lOJsQtpegiKNWhe85Bh9VY9GT0HvLpxlCMLYc36aScv5KGoVh1GhbwbnDjRwvm4u85UQaac6cxLgEV8PKJ+aapV9XLgckFju4/ilTyAAj6e+OIWH3b4eusCdNudsh9W/0mW+HzLEm/Aaj+nrDxrcefQSwSp62wEWOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907101; c=relaxed/simple;
	bh=cnNo9W12NhCz5DB49rDqOpnrfJrsY5xjkCHj5l6IZJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/S9wuv8WBUEsPyVac0HZmseCrO63XBCXMUMDezh/NGgoBYKySY59z5Mv3EAQ6SaezHj45Gj86gwJYsdTGo+hLoSGT9tXqb0ghMlrQ/8djuQ0SkrAEa/mrsf5DVXE38HHkwGqRv6Etc9ttvJBhDenNWlnd7hKHPD4PBGi0UBFro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aAum8dNR; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aAum8dNR"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-502a26e8711so20846691cf.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 03:04:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768907098; cv=none;
        d=google.com; s=arc-20240605;
        b=hBLY4dLgeVTxYwIULDIg/l//o8sp+3GlsCOAcY0MdRZ0saFlqzXiPnTtMwBoiZSiOv
         uqkCU9VcW9caDvV2gkt8PF4lWpjJyllvZAREBCnXdJVJe1dL4l6Yg3BLyGzaDG6eYch/
         5Z0KicARD/ogGyCFs4UwKbDdN8uCW9lDCmOIN96eqMi/5bKmR3wlhqg3rxYU1H4Id87P
         i564/8yqfaZT8AZV5PLdvrygfsBWZu43nW+djmWS8/vT3t85iKa+ISe/K84BIwwjcyNh
         rv72ExtDjKuUUigpX75tzPTmXLbmQC9S4+eptcLSDGc1ySO8qguLX5omL8RmA1VPuWuG
         NVTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+KC9nK0KpQPdmvTA7SrKRg+ar3wUw4irfinZL9hXebI=;
        fh=iMXNIejX2LQJD0sEHjhwGsikEvJL5z1N0Ozu22ElO+Q=;
        b=R9gTgytwrzM2bSrsQ+6qIz3/TQcfAV0cL0aZsBBFo2fLx3tEeou6yNqHyd7jfMEzs+
         fztdqkQ+n8XaVGPsLfKE1mjkDN3VyrSvMjdYE86dkrt7fb6Wb4ZkQT1ydNKtmt8d9mWN
         yhQpPugcLHDpLUskrr8ZllzdSrdl8a8KsQBxDD66U5DRzcjFVa8oMCMPVvIt5m5gJPsb
         HWhh0uBu2Hd2XPO7fkvWZRR60wu7bR5WAvKjaB8Gkly3mmxpeFEk88y3liSPWQ0ZLxa+
         /cW+zatiPG/OzDpbUkSCaYpRJBSbE2Sv3CFzA4ZndF5Q63RvfwIsFU/PC/5tt+/ke0ZS
         IB5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768907098; x=1769511898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KC9nK0KpQPdmvTA7SrKRg+ar3wUw4irfinZL9hXebI=;
        b=aAum8dNRtFuM12p/XTI/44w/QzyBcNFdHNXzZq2ZQcbYak/dfwBEGL1Nbqy1oms5+r
         NCR5LuHMCJ5NMM6B2/WGkjmlTgHEu+j+jCnwvwATa8ou/i6Lj6s+s2G2qHBbZOLRygOm
         HAEZFKaWywAUQYqjrGwp6qZQzvYOg0JWr7HxU/8eMs/0nKVZyH46rYb7leHwQHPlsW2j
         Q68wXz+SLJDnY1ZH3Aebf+XvtN/LyXbwEwsRVrr8wX1uu5JVPEazIeNIb1Qv2PXfFfqQ
         MpLIG2ziqpW8dnNCitlu1W4+tFag3WRY52IzxILyReCKt2tCPOGayeUa6zZc6VMdBQah
         951A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907098; x=1769511898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+KC9nK0KpQPdmvTA7SrKRg+ar3wUw4irfinZL9hXebI=;
        b=VfHhvo7Ke8LEAZmqgPpcca01y3O93fPYbJP48P+7JG45f3v8xwhkAXgt/wFynf4fha
         qUC+R5IPNbEchPgp3ZPyDvs0C/0PTAxhr67h3AyzGGjc2bRw7c6zXvkmf/q/7ptO3njV
         ztFBBOnjUjMV/nftFL9Hx7n1RuvT26SIjThspR5dYAVi2701pHwHzLpJeC0vDC9hOSlE
         aO4OdKmezkfHw1dhXjdDul9vYYNdSe94f3gOINjLmCUcQMPuK15AK24OsvdkxD6Q3KDn
         cSsFAadvFSf9h5MuSRAjNupaGFZloAUAPkQ12mPQv95zpOduZLM8rpXNrrd/TumhQwye
         bJ/w==
X-Forwarded-Encrypted: i=1; AJvYcCXQD1Mrj/iiUp+RYZ7W7ST84lw643HMuVXwnmoczFsfm9I5ng78RDsV0Xzwruc+ykH4jflFoT1ValE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNBQ71DHYuhfYscoPl6xOSZcu3gASoOhx9ALTHkqsymirLOdev
	0bdizrinPpfGDX3YfgidTUw0XcHcvJRmUo6d/MJzI7sp61vloBAnuy2ExCeQh668ahlxEPsQTej
	bgjiMrC90hW2w1CVQVDHSJNDjwResxJ6hRQhkbR2h
X-Gm-Gg: AY/fxX4Rn6BvEgwqozAh7UemHtDy8J4AcbT8MHsPoupBMvy5EuKPEysJBakevQkpV8T
	5sZERhGaVS1g8kh/c3BwYvsksT7YpDlh43nolRhufUh7/lsk8tMzgl18iV+TxU+FMagUj/kd9J8
	4WW4eS3EjwKqM8K2uJnO6C+cQChx08aSvSxrF3Ht/fRN0k0dddev9CSioTNaooRM8MGKMUEuNNV
	Tz7+ep5qg1Y/SDOirFHiOu9vw6SXUDtIYqD5INQzOQT4Tiu33MbTvYuDOtX7ZHjh2wimBs=
X-Received: by 2002:a05:622a:148:b0:4f3:5961:3208 with SMTP id
 d75a77b69052e-502d82776d6mr12850331cf.12.1768907098103; Tue, 20 Jan 2026
 03:04:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119185852.11168-1-chia-yu.chang@nokia-bell-labs.com> <20260119185852.11168-11-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260119185852.11168-11-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 20 Jan 2026 12:04:47 +0100
X-Gm-Features: AZwV_Qgu9ZDw1Q07OvyxlnkIP9uze425ltlSjgpCGKeRZRntsHDU01ieZ5kjIGg
Message-ID: <CANn89i+NEyZ+1R1pouUcroarCfNrQEN01azsEhOuZoeR0Y3mhA@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 10/15] tcp: accecn: unset ECT if receive or
 send ACE=0 in AccECN negotiaion
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, parav@nvidia.com, linux-doc@vger.kernel.org, 
	corbet@lwn.net, horms@kernel.org, dsahern@kernel.org, kuniyu@google.com, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, dave.taht@gmail.com, 
	jhs@mojatatu.com, kuba@kernel.org, stephen@networkplumber.org, 
	xiyou.wangcong@gmail.com, jiri@resnulli.us, davem@davemloft.net, 
	andrew+netdev@lunn.ch, donald.hunter@gmail.com, ast@fiberby.net, 
	liuhangbin@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	ij@kernel.org, ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 7:59=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Based on specification:
>   https://tools.ietf.org/id/draft-ietf-tcpm-accurate-ecn-28.txt
>
> Based on Section 3.1.5 of AccECN spec (RFC9768), a TCP Server in
> AccECN mode MUST NOT set ECT on any packet for the rest of the connection=
,
> if it has received or sent at least one valid SYN or Acceptable SYN/ACK
> with (AE,CWR,ECE) =3D (0,0,0) during the handshake.
>
> In addition, a host in AccECN mode that is feeding back the IP-ECN
> field on a SYN or SYN/ACK MUST feed back the IP-ECN field on the
> latest valid SYN or acceptable SYN/ACK to arrive.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> ---
> v8:
> - Add new helper function tcp_accecn_ace_fail_send_set_retrans()
>
> v6:
> - Do not cast const struct request_sock into struct request_sock
> - Set tcp_accecn_fail_mode after calling tcp_rtx_synack().
> ---
>  include/net/tcp_ecn.h           |  7 +++++++
>  net/ipv4/inet_connection_sock.c |  3 +++
>  net/ipv4/tcp_input.c            |  2 ++
>  net/ipv4/tcp_minisocks.c        | 36 ++++++++++++++++++++++++---------
>  net/ipv4/tcp_output.c           |  3 ++-
>  net/ipv4/tcp_timer.c            |  2 ++
>  6 files changed, 42 insertions(+), 11 deletions(-)
>
> diff --git a/include/net/tcp_ecn.h b/include/net/tcp_ecn.h
> index 796c613b5ef3..f5e1f6b1bec3 100644
> --- a/include/net/tcp_ecn.h
> +++ b/include/net/tcp_ecn.h
> @@ -97,6 +97,13 @@ static inline void tcp_accecn_fail_mode_set(struct tcp=
_sock *tp, u8 mode)
>         tp->accecn_fail_mode |=3D mode;
>  }
>
> +static inline void tcp_accecn_ace_fail_send_set_retrans(struct request_s=
ock *req,
> +                                                       struct tcp_sock *=
tp)
> +{
> +       if (req->num_retrans > 1 && tcp_rsk(req)->accecn_ok)
> +               tcp_accecn_fail_mode_set(tp, TCP_ACCECN_ACE_FAIL_SEND);
> +}
> +
>  #define TCP_ACCECN_OPT_NOT_SEEN                0x0
>  #define TCP_ACCECN_OPT_EMPTY_SEEN      0x1
>  #define TCP_ACCECN_OPT_COUNTER_SEEN    0x2
> diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_s=
ock.c
> index 97d57c52b9ad..9d16cb9c3db4 100644
> --- a/net/ipv4/inet_connection_sock.c
> +++ b/net/ipv4/inet_connection_sock.c
> @@ -20,6 +20,7 @@
>  #include <net/tcp_states.h>
>  #include <net/xfrm.h>
>  #include <net/tcp.h>
> +#include <net/tcp_ecn.h>
>  #include <net/sock_reuseport.h>
>  #include <net/addrconf.h>
>
> @@ -1103,6 +1104,8 @@ static void reqsk_timer_handler(struct timer_list *=
t)
>             (!resend ||
>              !tcp_rtx_synack(sk_listener, req) ||
>              inet_rsk(req)->acked)) {
> +               tcp_accecn_ace_fail_send_set_retrans(req,
> +                                                    tcp_sk(sk_listener))=
;


Ouch.

I think you missed the fact that a listener is shared by many SYN_RECV requ=
ests.

Consider it as read-only here.
