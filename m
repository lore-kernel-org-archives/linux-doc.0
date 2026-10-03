Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6873AA9F8
	for <linux-doc@vger.kernel.org>; Sat,  3 Oct 2026 09:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021378; cv=pass; b=NfWqfDGtEedy3uQhrVPyfL9OyuvF43LVd4UOR7dqIwIDO6/1BLuFYxMfKDYjb1HUQbGfnppQ6M+jlaXFRFo/I7aQKuP4HMGthl8Azp+AC9OIHEagOBb9Hl7N4PntnNye3Crel5xnx7EHVe8a3rG4l4gMBuyO7YPgaCEdPu8IYKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021378; c=relaxed/simple;
	bh=/AHnFAHcZ/XisFRf/YAi+UxjJLiaFOISzjcop6LQd0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ugx/BODVK4ivhXUI52ArP97WQZvpRIubhaQL7acrhykSpmsREFHLaoxVzPwjRx6b4cwnQGosOJ3Bx6ansVB34jlpNh00gOWQZmrFb3Ce767rSnynxe8F7Z6omU3m5LmHeN3Kwr4qTeKAp5p8qxPLDaRWXwCEqh4lGyw1boLje/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ob2ME6DG; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ob2ME6DG"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a77cd0cf7cso908331fa.3
        for <linux-doc@vger.kernel.org>; Sat, 03 Oct 2026 02:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791021374; cv=none;
        d=google.com; s=arc-20260327;
        b=qIctvHBsCEg2tEUyW1D+hNTNUkaGCGnSycDVReaQSyA7prE+cJOwYzBPwFywaH293i
         ZYb5EUi0+qfiiEVjkzsa4/02oVJwaSket2o1vUWLekrtbgMaqTh0KY5zi3PPK3OKMdZA
         n9fnsvFa8+b2t9rPJnppibYIKWxgZWWO2CZEs9QLCVKrOPPsetK4o/Mi8DbCkld5+Ta+
         Vbq1vhkbIZOKnnVBpWpa8kf+U76jlRe2Qb99IubxjJldRhUpAjQWbB53hgdBXEbLMg4q
         c7wog3iAghCzkHGzOfw2EDCaEEvtffruA+/O0JhBcZUBCX4AerLJCG1qhH8MQkfZyOLR
         3YPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JQkpbNNEsN71sAfq8SY4oa/9xDoFJzkXgdCKEiARGdA=;
        fh=uE7lEZoqDE0J7mGDCWRssvJf1uuHrYV8QCPNx/O4p20=;
        b=MkHL+o64lqObQgZigoRS26ehawqYrvFakwiG5ruDirf59SGxRbdK+1pfsEbxyl11j9
         o2gIlyO37XHUxSLUOnMQ0OgNyo18BA2FvcGrtTnXOtK1o6t8UIK9uQppDsoNorPdzDkE
         hajyUfCAS30lPsPVMBuEapAWC3LRkErCKXNzFER7rW7Tpde07NXZHaIskGHXVG+IEOW/
         NnQ06vI5DLy6vEYshXdi1QMXhOXIc7cV2l3Xe6JeEtaCBGRtN/4KoK9p326wc6FY4myd
         BFKCtQjIh+2mJqXwlhH0RXVm5NOTaEwZ77zDJlPq7WLiDQ1DsfxvLqmB/ulX8YsJLVkV
         axOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791021374; x=1791626174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JQkpbNNEsN71sAfq8SY4oa/9xDoFJzkXgdCKEiARGdA=;
        b=ob2ME6DGzzEZ3sJT/VwZZpKiZzkQGrAtFE2vvpG6oUxa4NxSGqf4A+peysjnDUHc0l
         R1ZmoIQCnXSjcl/CvQVHH/Goo8e/QyXIn2hkK4TKMT+3dCUO47XbgWi4xnuSGS3QtEPr
         i1ELal9JQ4Uk/oktQT+nJsFC9zhbA6ypreMpXAOkUl57oYlvM0+S0/IfTTg+VM5k0Wfo
         Y9O23qG8yaUGDhsGB5X8ks4RqFyOG1cVOwCCcuZ0lMFCPc6ZFbZNC6TRHRooyV1uNmUa
         KeSP/W/IvPU4egZUM485fIau2C3ZgmgOmVp6XDNJESraZmAL8XaMw9b97kaXC4aos5Ic
         RA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791021374; x=1791626174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQkpbNNEsN71sAfq8SY4oa/9xDoFJzkXgdCKEiARGdA=;
        b=xhV6mGMqGdi8uUxsils1uC+ndxiUmdJKk+H8e1uaAXw51hUI1X4Lt/VwNbRnM6/Jsh
         /YTSKIkh4RGWeCeI/hANVAkQ7J+EMTQ09/4JX9tYTe48Gy89jvk1MXq6eUDUNfu5iNwu
         AfIZsICgxKLOt5CoecSRqtSlH53fHRQA7lId+Re4aq9ZFPahIWd7alEv9SL9JRJh3L+U
         /zE3bG274aFFHCeiRYMH6DaTLw1PH2XHjy9uv4r24gvPlS8rAqkH9kl+AFSSs6/1ACv3
         Az1v2JwdtmgnjW89tlSKYSuSwGduS+qrlhkol03e6xxAdI0+YfIzn1kv/5v0JTg1tHma
         KJww==
X-Forwarded-Encrypted: i=1; AKwUvBwuiYd5SRb3ZfXNtJQtX8pbWb+YvR9GsiX50HvMfUvW7rR+YcTXRZOVUmV0d2G3vEEcxJWARy0H4Pk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0LPIrHEoI6a2MCsujeF2XAUY/g3oQuabdqAE6RX6LACDKv/wa
	SeCPUNv1h20KefkttuNBt7yC3W+vdLgqv4xElTvDGR6q80Zj6FLbhqlLLw1RhOu/shyVQz69rzR
	IRyuPS7Z8unIPg4L9xI73aGWz/QzbFSk=
X-Gm-Gg: AYBFou2bbl6dEg0g4tjuI3tWv96ulBXkd6r2wAEuoE6oyacAZiuVfBrNcT8gFQ+toZk
	MnS9o5Cj6VjrP0n+QKpPjnBXKp/8euDJw+8T16PuOHGrqV1aT8IZ9AivTHHhzdC7XPj4sSIezgg
	keiO96CdHIuPUiqrjIcjmzut3A4j0KUFsXYu5FbULScFpduXEdCq4sScyzSv90k3t5cMyqAg6q9
	7bYB5t43aF2su2435AawN1IhzYTATzH+LdWj0jNG+RacoAgO+0ZCy20XTguye6pYht4dxyB9gB5
	hzHlNns/GnAbL0S5dyFgBDO68OlYjr/EpJx4uVICBIkfBP4Xl6TIlSAn127Af9dFjJtLxjzgJUE
	dWr3ZAHhzPEE0ULj2lYh3avJYKoMxnecyFHIK
X-Received: by 2002:a05:651c:150e:b0:3a6:5cdf:d9a4 with SMTP id
 38308e7fff4ca-3a88755fdb6mr15688531fa.2.1791021374327; Sat, 03 Oct 2026
 02:56:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929131020.266120-1-chenyou910331@gmail.com>
 <20260929131020.266120-2-chenyou910331@gmail.com> <ar_APS7UG25kXXYH@wyuan.org>
 <CAKspUhKypHhegcJJ1DokVhUqLCBE+VaQkX4cMw+tt2L2p1FgYw@mail.gmail.com>
In-Reply-To: <CAKspUhKypHhegcJJ1DokVhUqLCBE+VaQkX4cMw+tt2L2p1FgYw@mail.gmail.com>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Sat, 3 Oct 2026 17:56:02 +0800
X-Gm-Features: AclHuK9jc09bWrU38UVJw-t1zRqljdvEpWFTPOkrnR4D1RSeuc2oEsRAxr8jYJ4
Message-ID: <CAKspUh+XM_E0CyrG8Lf-fGNFuQop0+i5_O7b+eRJ_Ghp0x6JZw@mail.gmail.com>
Subject: Re: [PATCH 1/4] docs/zh_TW: move security-bugs to process/
To: Weijie Yuan <wy@wyuan.org>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn, si.yanteng@linux.dev, 
	srcres258@furdevs.cn, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 03, 2026, Chen-Yu Yeh wrote:
> The <N> commits since the move, including the new sections you noticed,

That should read 17 -- I left a placeholder in. Sorry for the noise.

Chen-Yu

=E8=91=89=E5=AE=B8=E4=BD=91 <chenyou910331@gmail.com> =E6=96=BC 2026=E5=B9=
=B410=E6=9C=883=E6=97=A5=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=885:53=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On Fri, Oct 02, 2026 at 10:31:25PM +0800, Weijie Yuan wrote:
> > > The translation has only had mechanical changes since it was imported=
 in
> > > 2021, and the English document did not change between that import and
> > > its move,
> >
> > Hmm, is it? What does "mechanical changes" means? Does it mean small
> > changes like typos, format, and etc.?
>
> Yes -- changes that did not touch the translated text itself: the
> address updates in 2023, the tree-wide character conversion, and the
> path updates that came with the English move.
>
> > Maybe I got it wrong, but I noticed that the current version has quite =
a
> > few new sections and additional content, though. Am I misunderstanding
> > something?
>
> Those all went in after the move. The window I meant is from the import
> (July 2021) to the move (March 2023), and the English file has no
> commits in it:
>
>   $ git log --oneline --since=3D2021-07-29 --until=3D2023-03-05 -- \
>         Documentation/admin-guide/security-bugs.rst
>   $
>
> The <N> commits since the move, including the new sections you noticed,
> are exactly what checktransupdate.py reports against the 44ac5abac86b
> baseline once this is applied. That is the point of the move: the
> backlog becomes visible instead of "Cannot find the origin path".
>
> I should have written "between the import and the move" more plainly;
> as it stands it is easy to read as "since the import".
>
> Thanks,
> Chen-Yu
