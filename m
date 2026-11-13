Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794591104;
	b=ZCTryCk4D7HYqu3C0UANM/hYbO6h4OkQ9HKQc5HiKUQrlUTmrg/5MpO4tFxAJc1/Wr61
	 RBa70+FF3qPOL64Optd4VJmgRN1+o3L94o+URh/owOkxkqlsxcvAGyWtbqh/t/Hq2XQrW
	 39IckM8bDEJMgsAgsc0oXijyKap6tSOlmyGO4e9VnCctrmulqq1a2aA81bW0uwP173+Vj
	 S8jEgJZ0anuNS2/fSqxaPCIr8vQnN421eLEs62h3FHX9KQs/Th1jPuqkjYQ9g8RSnwHhP
	 O+X9KgComDYDNnrJyYby2dvPHfE/kq40j4f/d64K4Z05x02ZjSHZdkM1WjgWtPFz5ag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=;
	b=htQRjWni2Wqsg1Ney0pJlusnoBMKq5iFPjRyUvmmYJdbnKgEUkj+tE3nNWA7QK90jULd
	 spitu6STofTFi297Hd3Ia1tkqYh7YDKx93rTkXl9trxiZPb2ECLzc8FUl1C+nCYZvlvlc
	 D3yueCIbSZFnd1mZgyykgDjGzXPuIIrKH1ey7xLg3JNm1EMcP7d+nUeor/8rviFX9CtLS
	 7Ekrt55i71+Pq0Wo5ELg1/mgMeK34NFHk/4v9j0BUJMwCjZpnPLblJmhpAyk6aAko1Lln
	 5L3yOWAKf16RbsbbeI/h1NB80rRLH/+epGJ50XEQcpgcC7IxM4Q61sxb/tfnTy/mCow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=le7K08J2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E416074B02
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 17:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77E416074B02
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=le7K08J2
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6798af41644so916513d50.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 09:31:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794591102; cv=none;
        d=google.com; s=arc-20260327;
        b=OdDYWBlj06esbFALnmIOQ7t3WrWT6A2Kpfi7k7r2+NBbHrNquRe5JPkwv/Hgyodgog
         A1MNElFrkz28Sp2tZ/xsoU+IAYY4ANbDhF82zHfRwPVJBKnJRSu+xQYlADjX8S7+dQg4
         JKdjs4ffc00/3ka0Bz63eKWO3+YltDaRetIJ67N0GSdktmG8W0VvMzAG5MPKrWXuf5qh
         +F8vtDhVZq4emaJ65bnXNeLytuWi4koaWMVIDkvK3PhT1ydNPS7RjUARj5OZIZdcfJHR
         5/6nTYoVCpx8OG1swsXU+lBJ3CwBn+gjgv6ITY6qL94q7UIm3WyUEy0ukjpMK2DobYRY
         cnWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=;
        fh=SSeY2n32UgUv9OnCD46oM37mEtk8cYymmk61vgUwYCo=;
        b=bLOPkM1rKFNtITMq1UOIMUBoYYr9OS3Qw7wBNmMhKc3ruEI5oN40FJEoGRu8IPQ/bx
         TM0DaFgVSigd1tB04dss4l+DPsDnj0TOOJBT2xeZM/94t/kl0wCxlQ0oq2zjh0GsNsxI
         0Tn5rAAeTiediPSy7FweGxXdr8GLeYusS8gXWdtSdy/2/xt8YWZL6vdkznAhnmh9/X+c
         9MfhVBNwhjz/8lNWCMJzB/oO4LEYSBga8J79DMugLbhni6IzIG8K0a1aqZ0hKNlLHoxc
         j/2qseaOe5pZ2xN230US5ffOpSwkeC6WgVA4YxJh4Trd4HShU/Jj5NymWfbPB/5O+pN8
         XdbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794591102; x=1795195902; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=;
        b=le7K08J2bA9Hr/68cdqwbf46C9tMiphP0VQXGYffptEgLGcYlBKFs1xCYmmjfWjy2E
         XIszWAT/7Xhu4ghnVl3bc/lkD3OXCS+X+Sm9CF+iBsK3mKNKSdMaYb/9r7sGzSB1TqX4
         00vaf2a2WnZQMW1Xe61TFGa6iALCGdNBSUY/M2ghQlI3neAa9DiyMLIG7WIID9pwE+XF
         M/t3wHfr+NXVnw+PnTtamguLyZXa/fpwaLUAg4I4Frca9/0u8MW0fZ0xPj0dCGmRxMrp
         OeKijB7gk77FddFRj8+DPtNF3nc5508pL9LOQe+rsb5MZGk+5Fd5fWLJtsbl2ke2sY/d
         uMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794591102; x=1795195902;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=;
        b=bM4nDB6r0Zqs9jDefBXgzE+xYPFiwEqi3PibTUj/vbFNz2wckcuZ5T41EhWFm2tVfW
         NNkzd/tw+pideFo6FW3tJ4G3boKXRZ+f8arPCt0Rk8e7FYvfKOvPkM/+AIYfwHwIDjaj
         2d9eac0hGOzmiwO45IhuOZwKCq0ztMtDoiI4VIMcr52WY3Q4D9lzoHiMqFhfP463RjoK
         EcGomwrhNMfcfRob+Jx0BT8JgQWIA38MT2W+F6YwLrM1tHtcrZJpJJJLRV8IqYQLzu8L
         cAwSi/PyIYV2xjNuUW5zRV6lkR/ollVg3A4J3v96BSJ8cx80sZ/RUG65VwC4cRdHPA1i
         18uA==
X-Forwarded-Encrypted: i=1; AL+hErGoOPVWwY4OclRp5exhExh4bf9WaAKhZ9MDbUkT6xcRuwCKY+ueWz7c0LQEGQIpYbtEGZ2Bup2O4TE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/72RAviLvsZAGAW8QZAN+w5rOyYz/R0U44pWx5okOmnltQfwyM
	iLb0X/Na8cDqYC2Ld5GNJSKLtuzzlxMEerq3nNSrBU1dSFIsU6xOktmmhghCHMvGd5VFEQaBFbZ
	mwY/CIjo2Iy/iMsOsuFk0Vsq7ClenW/8=
X-Gm-Gg: AYBFou3aAQmDjQNa5e8BOfMXfj3wZ96v+4KM/CF0PAxjMTZ1vywrs7XimnLLRenKa45
	oHB68USJv766yyF76/K6J7UwVDDx19koQNCCIMgpA9N2kS4hMYjA8jO1OAkwbDu6SpVBttWtLHL
	cNLX5af6kJKk0qP19lTKXcxE5Qb2sWkK1tc5cPZlhr8W0J/DDtm5iHd93iUWLZv21OL0Dh8m8q2
	x4e2Ygg1y1dCtOjZdJKDpEu1s0AQEyJcWQE59veiuMOYzFTa8Ev10HSbx0BqpZCG4i/9F+Xdblk
	97RrIDb+5zZR863khCHOWp8BrdgMjNlWpXqhilGEB3yRS0j53CDyOTvUk1xKMzZG+dGVgfHMubO
	kmuel1RQxFmhUqqRwFVwprwnTwJCNJt+6IGcBcetQf+9FeRvbtIgm/zKXrU2LBHtQxS/B
X-Received: by 2002:a05:690e:4510:20b0:675:47ba:2183 with SMTP id
 956f58d0204a3-67d89709f2dmr1486987d50.53.1794591102378; Fri, 13 Nov 2026
 09:31:42 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113003217.197757-1-ansuelsmth@gmail.com> <20261113003217.197757-11-ansuelsmth@gmail.com>
 <737e3c57-9aad-4081-ac75-f79cb2084349@kernel.org>
In-Reply-To: <737e3c57-9aad-4081-ac75-f79cb2084349@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Fri, 13 Nov 2026 18:31:31 +0100
X-Gm-Features: AclHuK_T9pn_LFNwcoFkFSy1mvqcLyRF0a8TMF1gVMEOv5saT-u9fzFGXIXxZrg
Message-ID: <CA+_ehUxzPo--g+Ksd_0xJZo7_bhYZ-B17wG3OyGtU=3aa6B+WA@mail.gmail.com>
Subject: Re: [PATCH net-next v19 10/15] net: Document PCS subsystem
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Il giorno ven 13 nov 2026 alle ore 11:52 Matthieu Baerts
<matttbe@kernel.org> ha scritto:
>
> Hi Christian,
>
> Thank you for the patch.
>
> On 13/11/2026 01:32, Christian Marangi wrote:
> > Add extensive documentation of the new PCS subsystem and the fwnode
> > implementation with producer/consumer API.
> >
> > Also update the sfp-phylink migration guide.
>
> FYI, the Netdev CI seems to have issues with this patch when building
> the documentation, because a new warning is visible:
>
>
> /srv/nipa-builds-contest/testing/wt-doc-build/Documentation/networking/pcs.rst:3:
> WARNING: Duplicate C declaration, also defined at networking/kapi:486.
>
> When executing:
>
>   https://github.com/linux-netdev/nipa/blob/main/contest/tests/build-doc.sh
>
> Logs:
>
>   https://netdev-ctrl.bots.linux.dev/build/doc-build/results/909345/
>

Hi Matt,

thanks for checking this... Yep I manage to reproduce and I fixed it.

Will be present in v20.
