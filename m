Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795817737;
	b=18Qd9y6oowvoJhYTI4b5kfAqr2t+GuPp3X2kkfbC+XWwwxBJRU6xi3kre6c2hLhADSnk
	 tL+geNJANDP+KTCKF1YYy3OWzxuOoMK+mmXj6MsXRCPQ2KP2ThGcR+nuPfwepAO3quoL2
	 ShyrFJVcJAf5hnjAJH2iQPA6IzCWDBWPjCG80HYoMNokFOcReN/yYnUi1YnqaxT52+sUc
	 26a/S7RQ0IL+Eoc8pkzbDmHPNUb7O6elG47hRjjCNjxs2dtOQrTmJDlRBHnd+HxOZIhqO
	 jY9sKMGzNPd2F3Wx5nJW5w4vnC8drjNO6Wa1Gs/rezUzr409JZfQHh1VYlcbEQLB6/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795817737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/HmmmGXpG7ODtH3/h0goccA1+PPzXKMF50hfxQ5Yw88=;
	b=B8Vl7XbYOFj34xVmRx1f9M/flnJaFs7UW6bx41qL/1JO0oXLiw3EloppZfr0EEwqUIR0
	 8ANCglWkzZ42v8ZCl8vFro47LGRCXdDra63mgJwdF5bXzmnuklnP+FYtu1WUjH8ZF0MP8
	 q8m4W+fk/N/NkSsmM/DUo1FdYD/0xWaGM//eRATOagspDygZOHkRDW3+I2h1Vur9WkIQ3
	 YN9M4lyn+Bt7+RaZ9nL32rsvO103MPmHNpny0KR/7FB52oEoh6p+8VUVcvMxND3iSs9Px
	 iTuz6xVLehV/QGFQQr8jNaFZqBssrKik7uFyzhihQjHqgej60jnqReNWy97s/RwHKnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=R7L1PNXj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CB8606A321
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 22:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35CB8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=R7L1PNXj
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b4d26094beso73116587b3.1
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 14:15:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795817736; cv=none;
        d=google.com; s=arc-20260327;
        b=Z7c4ZRkjVWQ+Ts6Uij0TDlnyeoVPucwq70GH8ujfp3HKrSsQru1rpgagpVfHiIW+VQ
         YUWS3YwWA9CP2HyAY1r7CHTKctMKpyx22XOrfNbPnOKe3ECoysS/b/KMeQx/Fot1hezU
         8cAoVQ/0YTccd5Wh1rtQArg58dv1F1OzeMYF+/R4u5xr4S2UbgsCRVAHKVOLblwsSnlu
         bJ4xGX6cDNILR7WmBLH2/uM540PiYQB2+zSfSM9t+cD+5Qz3D6ZY5Z0+Auq6xXd15BNB
         MJL+pPaKybUS/MmmDUcsjboWhCqwUI87OoA//WZy1cUbLFJa3P8LaiDfLZW6muLG67fJ
         u6gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/HmmmGXpG7ODtH3/h0goccA1+PPzXKMF50hfxQ5Yw88=;
        fh=pY79x2WJRReqnKG4bLPRp/x3Ihywo1uta3exogjtzVE=;
        b=AqN5m+Zx4OaEjtHl/JfXXLwpFosPCSu3RXwiLHdq01m2ahzzHjRly6P6ZjMBVW2LtD
         kJUs6F5nrWPjhQVzkVGeiJiflzn+xsqiDU+Z46VstfjFpfF/htxCpr0rn1K+k1jg3BCh
         4TtuK2JsKBBGAF2efnM+A1aHEQcW3qxbSsGnuhPHPAaXmkk/758LLaEXETl3i/b5dbnn
         bReaveM70btpSHXYuHJ9RZS6VNsjwDe0puVQasHzL0VQHihffIXyNJaqqWRyNToCq4DE
         FN4kS5HyLIADHt03WuuZrblBZ3npng9VdwinOHgvk1tfcxcWr6NH4ccaEEY8jn4lQX4d
         iO3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1795817736; x=1796422536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/HmmmGXpG7ODtH3/h0goccA1+PPzXKMF50hfxQ5Yw88=;
        b=R7L1PNXj/Md5qNgsN/Yom1TwNgr5cwmA81rdx25vyLc840UAih1c8rhCiKCIP4WGOm
         tw2Y0KOLd6rkQSfxmbPft1zsIJ+kM5NOrRHe/Zd2Duz2WLfnMLmPgPvoUz8aiEzeB23Q
         xVUjwqrAYPcRRvOJBgHKOZvZiS5RzLMyCRNYjLoyvUpEs/JkLncF3hIAMGTsYAlHKhjU
         8b/h/dl8zDLt5lyT/y/4XisjzHyiF1e9G1CEvNNcQNIQgK51pNCUqCSkBvEi4SuLYyWq
         6tTF+zEPg8f7SE9XGAUIJCZ1VSUzcE6wbEsbISRNoVEja5MS6sOt5j4BS/ozykdFKoVR
         Cb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795817736; x=1796422536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/HmmmGXpG7ODtH3/h0goccA1+PPzXKMF50hfxQ5Yw88=;
        b=scoWK0Au5AL2zaewX9/5xF7haKi6IAnpHv2BgA5xGsfmA+ZlgO0FIeSJvLWBtKftzN
         b8p4SpnngL9kxwpVqlSmavD8laUH60PiSfjAidjAmAh+8OSdT0ONQVCta/lKtseDyiw3
         PmJtM/MT+LSb0mja/ouJhLmNtmTcr4/gE3ORzGRqRq3u3drxyItvmyFZujlIk2XvIxsU
         h81o2B5RjR24WBa5ApB6Ur0m0/hWelrzmPeJtEMjorBt4BIqguNZST0ROeH+d0IMsOdv
         7B2TfPUN0yaUvTwjazrTlNdkpqG52skQ1ZTqMPFtmuukHIDbdZLPZARTQVl7wS/e1/6U
         j7KQ==
X-Forwarded-Encrypted: i=1; AL+hErGcJ45ZLtPqmgDyg4Fjdh0CktOY12EjZPFiqQlFVqs85o6gJCp6QzBSQ+rb6mXXaMk/iqiCzV975bM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8u7D5cMPfRwBL/YXWib8mGczfiay2gK6y58g8MVtmljAUEr3hH
	Y2FI431bRig7dLjreUIdYXAAVmo2lVT3EI/ImSAFe6djqOENy1zna2qXQETsHMY2M3dANCvL7iq
	7NroYgNmE0TSSOh3qPxPJm04dxMo3M6GphIoboeurYg==
X-Gm-Gg: AZFdTZdYqfiZ3eBthSzClArSzxzfWHTyZIecJqnpZggWBe1q3eZwia6BEUrZQzCzpQn
	KczIGsLUFFIOI8mtQkbfz2uJbF68vs5Lrt0jKxVyPFU/7NAZLeHMt874ZIRFrTjKefMNZxRv829
	O6X1f40F/d1jckhO9/EcZchN5lBhM4399vYaf00ZBLfIYtX5MDjT2q7twD4hcah6WgUqftqftxr
	Rj4HDdd7Kjifc/Qeth3TJiKwhHtdxtfBd0DFMitjeWDakqPY2T5cPhbx+e8lTKVj1haPoToBEXe
	VT+55UuqCL0/TA+JSLEkRaREZ1NUJJ4TLAowwpCOar+8C8Accv2tWmzvQC41HrXq98bkFpyMpe3
	KIMn/Rlfc0zNEATwwMeZfsDdSXNWAZ4VtQlBjSCQE/JiuSdBLHYtCh/u/xc+8v+hK8lRt
X-Received: by 2002:a05:690c:3607:b0:8b5:6e9:217a with SMTP id
 00721157ae682-8b5204a997cmr118432657b3.31.1795817735925; Fri, 27 Nov 2026
 14:15:35 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-tcp-l3mdev-exempt-ports-v2-2-b920f3ff8f5e@nexthop.ai> <179572802703.3135.17411865692194388871@kernel.org>
In-Reply-To: <179572802703.3135.17411865692194388871@kernel.org>
From: Kalash Nainwal <kalash@nexthop.ai>
Date: Fri, 27 Nov 2026 15:15:22 -0700
X-Gm-Features: Aa3M54p1KHSs9ceXPdvDTdxL0WR7OjSk7c2s4dSWeaRL6V-xTBYAqdTwA4fWcno
Message-ID: <CAAv61uR6XcazqvJySkz3SRHTmw3f8N-dV1xJUqO_RNbXxHK3mA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/2] selftests: net: add tcp_l3mdev_exempt_ports
 test
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, dsahern@kernel.org, 
	idosch@nvidia.com, ncardwell@google.com, kuniyu@google.com, shuah@kernel.org, 
	joel.granados@kernel.org, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 2:20=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] The header comment of the new test script
>   tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh (lines 8-9)=E2=
=80=A6
> - [Low] In vrf_and_unbound_listeners() in
>   tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh, the first=E2=80=
=A6
>
> --
>
> selftests: net: add tcp_l3mdev_exempt_ports test
>
> This adds a selftest for net.ipv4.tcp_l3mdev_exempt_ports. With
> tcp_l3mdev_accept=3D1 and the port exempted, it checks that a VRF
> connection reaches the VRF-bound listener in either creation order and
> is refused by an unbound-only listener. It also checks that default-VRF
> connections still reach the unbound listener, for both IPv4 and IPv6.
>
> > diff --git a/tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh b/t=
ools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh
> > new file mode 100755
> > index 0000000000000..da7f20bf2e9e6
> > --- /dev/null
> > +++ b/tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh
> > @@ -0,0 +1,260 @@
> > +#!/bin/bash
> > +# SPDX-License-Identifier: GPL-2.0
> > +#
> > +# Test net.ipv4.tcp_l3mdev_exempt_ports.
> > +#
> > +# With tcp_l3mdev_accept=3D1, a listener that is not bound to a device=
 also
> > +# matches connections that arrive in a VRF. For a port listed in
> > +# tcp_l3mdev_exempt_ports it must not: only a listener bound to the VR=
F
> > +# may take such a connection. Connections in the default VRF are not
> > +# affected.
>
> [Severity: Low]
> This isn't a bug, but is this comment narrower than what the kernel
> does?
>
> Documentation/networking/ip-sysctl.rst describes tcp_l3mdev_exempt_ports
> as:
>
>     only a listen socket bound to the L3
>     master device or to the receiving device can accept them.
>
> The check in compute_score() (net/ipv4/inet_hashtables.c, and its twin
> in net/ipv6/inet6_hashtables.c) only rejects sockets with no bound
> device:
>
>     if (!sk->sk_bound_dev_if && sdif &&
>         tcp_port_l3mdev_exempt(net, hnum))
>             return -1;
>
> A listener bound to the slave device (veth_vrf here) still matches
> through the sdif comparison in inet_sk_bound_dev_eq().
>
> Could the comment say "bound to the VRF or to the receiving device"?
>
> Also, none of the cases uses a listener bound to the slave device, so
> that documented behaviour has no test coverage. Would it be worth adding
> one?
>
> [ ... ]
>
> > +# Start a server in the background. nettest sets SO_REUSEPORT on its
> > +# listeners, so an unbound and a VRF-bound listener can share the port=
.
> > +# $1: IP version, $2: "vrf" or "unbound"
> > +start_server()
> > +{
> > +     local args=3D()
> > +
> > +     [ "$1" =3D 6 ] && args+=3D(-6)
> > +     [ "$2" =3D vrf ] && args+=3D(-I "$VRF")
> > +     ip netns exec "$ns_s" nettest "${args[@]}" -s -p "$PORT" -t 3 -q =
&
> > +}
>
> [ ... ]
>
> > +             for order in "unbound vrf" "vrf unbound"; do
> > +                     read -r first second <<< "$order"
> > +                     RET=3D0
> > +
> > +                     start_server "$ver" "$first"
> > +                     pid_first=3D$!
> > +                     wait_listeners 1
> > +                     check_err $? "first listener did not start"
> > +                     start_server "$ver" "$second"
> > +                     pid_second=3D$!
> > +                     wait_listeners 2
> > +                     check_err $? "second listener did not start"
> > +
> > +                     connect "$ns_c" "$ver" "$addr"
> > +                     check_err $? "VRF connection failed"
>
> [Severity: Low]
> Can the first server time out before the client's SYN arrives here?
>
> start_server() gives each nettest a fixed -t 3. In nettest.c, do_server()
> does a single select() with that budget right after listen(), and closes
> the listener when it expires:
>
> tools/testing/selftests/net/nettest.c:do_server() {
>     ...
>                 rc =3D select(lsd+1, &rfds, NULL, NULL, ptval);
>                 if (rc =3D=3D 0) {
>                         rc =3D 2;
>                         break;
>                 }
>     ...
> }
>
> The first server's 3 second timer is already running while the script
> does all of this:
>
>   - finishes the slowwait poll
>   - starts the second server through ip netns exec
>   - polls until wait_listeners 2 sees two listeners (up to 2s)
>   - starts the client through ip netns exec
>
> On a slow or debug kernel (KASAN, lockdep) these steps can add up to
> about 3s.
>
> With order "vrf unbound", the VRF listener would then be gone. The
> exempt port makes the unbound listener refuse the connection, so the
> connect fails and rc_vrf is 2, even though the kernel behaved correctly.
>
> With order "unbound vrf", the unbound listener exits early. The
> check_timeout() on rc_unbound then passes trivially, and the subtest no
> longer shows that the unbound listener was skipped.
>
> If wait_listeners itself times out, check_err records it, but the
> subtest still goes on to connect.
>
> Would a server -t larger than the total wait budget avoid this?
>
> > +
> > +                     wait "$pid_first"
> > +                     rc_first=3D$?
> > +                     wait "$pid_second"
> > +                     rc_second=3D$?
>
> [ ... ]

Thanks. Both are fixed in v3. The header comment now says "bound to the
VRF or to the receiving device", and new cases cover a listener bound to
the VRF slave device. The listener that must not get the connection is
now stopped by the test after the client connects, instead of relying on
its timeout, so a slow setup cannot make it exit early.
