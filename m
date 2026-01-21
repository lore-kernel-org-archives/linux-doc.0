Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B839B426EB9
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 21:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769029672; cv=pass; b=pSBusxmz7z70TGi+UA138TYU+RIP6znkbfu9VEYNcrkewlLs7mR8jocvk6J03GVXrTxyxq3BK1ATmIzh6I5fmIDWwvwwSyhiHfox3V76YVK2CPPLDjXenXiEy2q88enHkKNRmZjN3ti+yGwTIJ5SHO8ZN6dTdsabXZJ7TcQELJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769029672; c=relaxed/simple;
	bh=vIrtZLlR9y3VX65/B/Uk/Cvhdyt5IYMtPMqdkwsTUis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NcwkARmZCCVhPYxCEMniW/teVCVuczPQcYXsxYkSZGFhDdL8HvjTdhoHQcRlMA4F5LdDIrGzCcJW4EOPqKfkJoJ2UQNy4gAkmJIM3PXKeyJf/e3HrRF0TtpwZlUyaD5o1XLlRBgHDL1RtUGOiYS/GdZPkA0C5uM+NaW857QfRcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SQeqyJeM; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SQeqyJeM"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50299648ae9so24881cf.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 13:07:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769029667; cv=none;
        d=google.com; s=arc-20240605;
        b=fgam7/cvn5n8uoQGQ7E5MBd26FbgtHPrvNp1vBmtKhHbHPRw/9FdKZjQO2Y2WDN7xc
         j5dQHZc9DzFPqwNXtzBWYfnc88oLRKOnhjFPO5/P18VkL4PkylkvNxQZtoAccMjoezdC
         bFrCfskjdJQ4gn3GA4na+egwVIaTPZmpsW0P2Jf9kg/feUzgL4GXlNiugvd29Px4oVmg
         vO/kSLO7T7tRPhNwMt9H4YpSO27alnhDKE1BpVwu4cxPSej8os7pTLmIMAlVkAakLKGi
         TkXyfF+YYmYOEEFZIrX8dmmWjceV5Sxk9zhhX8KPkXtsoUP45AkLPFXnRFeqqyzorphi
         HWZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vIrtZLlR9y3VX65/B/Uk/Cvhdyt5IYMtPMqdkwsTUis=;
        fh=6fgBHq3soEYO6RTRi7dg/oMYN225TD79w3p+BLFQvbo=;
        b=ShRGDBkQAGEQPlpkHN+KilCNeg/6R222YzMbT0g9xYY7tgQvsph9WWgrbXS1o3BQKR
         qRp2x1WOTVztDRz8/sjjvnyLWLUG5or7PkHyV5fABSBlGMm7rRiizueBYPcqseoX2f32
         BToS8cvAVcsdJdfs6ZnVxbPawvbluBwWK6oQp5Tp0bTjFdcKD6+5yZ5ulMxZTKmh70oC
         avrasl1mvnG9cRBJvnFkHvld20UovYp+/FvnnFjZ+KwaiI9MaHhRfzjV83f21V85LX0B
         h46ibuDmvlPIaBnecE/rAsxUJpIhFOQ894GqLp2PejhDrJ2vyYhVDlgL+Ie7b6XnjySf
         qfhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769029667; x=1769634467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vIrtZLlR9y3VX65/B/Uk/Cvhdyt5IYMtPMqdkwsTUis=;
        b=SQeqyJeMzhPwZVMwezMEbd/Zhg8Dp6ruPVSwYPG/XOz1e5uRFg4ksHfL9QtwxIXHfV
         ptsIQ574V8qsD33A49aSXeEswthUWZu5q6OQztfVTUw7XbIFmX846CwEnmrdARgi0BjU
         zW+RSaH54PmqgSyE94iTpD5KkQkJuB7dTvgCBAZrBsTukd0VDNS4AAz8vhsmKBCUi1w8
         1ifEVM2pldEUht8y33DONlblUvkvItE8LdsGiEAalcWBpOdcJwEgFFB1fPfsK9/Xauwa
         nLv/48DFgjdTL2tP+n9XWtHP7ZtH+5DEbrDkDmTKHv7LvY8Q/2pTKlCTs+gyEPbrygm/
         tJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769029667; x=1769634467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vIrtZLlR9y3VX65/B/Uk/Cvhdyt5IYMtPMqdkwsTUis=;
        b=Axg9UBJbIRo7HaxgrPwcQxC39v7YUO6pAcUdWPzqYJ14Em4GBZMrWjyKZ40zr726Sa
         vd/FJ45CQAYKT22RBD0LouoDc9AGFvSGdVrY6SPsdZYJCC/3R+6nKTc76Pj8Glhyotr9
         MIdLR/PCRTrcLolGl34/bZRwGRm73BObBOM+7z0C2yUTgrv9NruyDRpxvqtN65zIVwIf
         VXWWC7eJY48pH/3p3IZ7FE8DIIBD7vNUCl/YKxBB+AHlhAugoSfJhzVhsYIFjWpFTpvG
         fdf++6KLegr3AEwzGlbo0C4aLHK3d3OT31OD+6hnW4CJVRKegYiTboYFgA+jP0tpGMA5
         qijQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNg3c9bMOkkX1gWjzrhZzeGCucS4ScD5EvBigq9YLUinFco4GSf/1auvPg2++N5unAJDt5uckacoU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjI6EwELsrWwfn8ohcrtqG/mqQnyAaqpk21vOVyiinU63oT9aV
	EZeVAmq/BgRzG/mG74SA8cUlZCJ1z94V8aqwJ8/A3XH1Gkf9UgvqNN+u/tvp8wyFAsgr6e3gcV9
	0FeMDzFuQCWrC2+LgUT2jYP258KBcyJQi14Ycqin4
X-Gm-Gg: AZuq6aIBxnvEL1AusMh35bvwRSk8jiSjA5BakalGV/jO9k+P0B+JDEblRmhoIaHhE5C
	JhYudrQs5mYjeDzIfXFmivDXV/wHTDeTnjFGxzZhw6RbnLz12YMWNFYVPWTJr3LqFsfBxsewaWt
	FjDO1jpgvWogKGHAzV53I2kkq7BBf/lJ+BHC4T8MBGS3RGuPB4UnBJj4BrVeZCFXQVnNPzKRpx+
	AOETleIpgJfjKHN5Zsik5xLeZAFvvj4zj08ga8ZSxS2AzyU7VGmLOe4D5dLKu5H9TOBO3r6bv8y
	gs1LiFnVCxehqCDOsmoNCXDWOxkad/koLdSlsWhXb7LpjYej+1YwJBRISQks
X-Received: by 2002:a05:622a:10d:b0:4b7:9a9e:833f with SMTP id
 d75a77b69052e-502ece23329mr407501cf.7.1769029666268; Wed, 21 Jan 2026
 13:07:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121143215.14717-1-chia-yu.chang@nokia-bell-labs.com> <20260121125504.32ea788c@kernel.org>
In-Reply-To: <20260121125504.32ea788c@kernel.org>
From: Neal Cardwell <ncardwell@google.com>
Date: Wed, 21 Jan 2026 16:07:29 -0500
X-Gm-Features: AZwV_QjMA9pxvIgwt5ruSX8S6CumDWx8tec6mJvW5t5NdsFW525cQ4qDlmi2IZ8
Message-ID: <CADVnQym58ujAwozxSgMNxcCBvTf5JVYrzEoDuBFTjheY-PoHHQ@mail.gmail.com>
Subject: Re: [PATCH v10 net-next 00/15] AccECN protocol case handling series
To: Jakub Kicinski <kuba@kernel.org>
Cc: chia-yu.chang@nokia-bell-labs.com, pabeni@redhat.com, edumazet@google.com, 
	parav@nvidia.com, linux-doc@vger.kernel.org, corbet@lwn.net, horms@kernel.org, 
	dsahern@kernel.org, kuniyu@google.com, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com, 
	stephen@networkplumber.org, xiyou.wangcong@gmail.com, jiri@resnulli.us, 
	davem@davemloft.net, andrew+netdev@lunn.ch, donald.hunter@gmail.com, 
	ast@fiberby.net, liuhangbin@gmail.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, ij@kernel.org, 
	koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com, 
	ingemar.s.johansson@ericsson.com, mirja.kuehlewind@ericsson.com, 
	cheshire@apple.com, rs.ietf@gmx.at, Jason_Livingood@comcast.com, 
	vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 3:55=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 21 Jan 2026 15:32:00 +0100 chia-yu.chang@nokia-bell-labs.com
> wrote:
> > From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> >
> > Hello,
> >
> > Plesae find the v10 AccECN case handling patch series, which covers
> > several excpetional case handling of Accurate ECN spec (RFC9768),
> > adds new identifiers to be used by CC modules, adds ecn_delta into
> > rate_sample, and keeps the ACE counter for computation, etc.
>
> Looks like we went in the wrong directions, multiple tests are failing
> now:
>
> https://netdev.bots.linux.dev/contest.html?branch=3Dnet-next-2026-01-21--=
18-00&executor=3Dvmksft-packetdrill&pw-n=3D0&pass=3D0

Looks like the first two are failing because the v10 series has a
different layout for tcp_info than what packetdrill currently expects:

https://netdev-ctrl.bots.linux.dev/logs/vmksft/packetdrill/results/483641/3=
0-tcp-accecn-delivered-updates-pkt/stdout
https://netdev-ctrl.bots.linux.dev/logs/vmksft/packetdrill/results/483641/5=
8-tcp-accecn-delivered-falseoverflow-detect-pkt/stdout

Chia-Yu, can you please post a patch for packetdrill to make it expect
the new layout from the v10 series?

For the third one:
https://netdev-ctrl.bots.linux.dev/logs/vmksft/packetdrill/results/483641/6=
9-tcp-accecn-client-accecn-options-lost-pkt/stdout

... it looks like the test line that says:

+.002 ... 0.052 connect(4, ..., ...) =3D 0

needs to be changed to:

+.002 ... 0.102 connect(4, ..., ...) =3D 0

It seems like running the tests before emailing the patches should
have caught these 3 issues?

Chia-Yu, can you please make sure you run all the AccECN packetdrill
tests with the latest kernel and latest packetdrill binary you are
proposing, before posting a v11 kernel patch series and packetdrill
patch?

Thanks,
neal
