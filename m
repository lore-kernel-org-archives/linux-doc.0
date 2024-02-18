Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D515820B3E
	for <linux-doc@vger.kernel.org>; Sun, 18 Feb 2024 10:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708251476; cv=none; b=UFT28maH4j34PniyxklMLAozeDQi66lF0MTVgBT/MxcgkHOQ5H71xz4i+jyZFg0j4H949dumvuG44AcAaXPzw9lLq9ydp4ANcWpxVZaAilQMp/lByx2yRX9LFIXZeLmZ99s3TEDFEsTrxjpOrzz90QZmz1V25kV4Ue6XdLePE4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708251476; c=relaxed/simple;
	bh=0/tCSHJoXcIQWsBkaehDRK6Abciqk6UyuzITcVPRxMI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lp1ZTLcicveVUmZOt52IqtredilOictnkrH5/fEaq8tqi9srDs2FHRrpQIODkncfKtJxMIC+EAuD1uj45XbkgciffQNlEUWedPypHkqfj5IhZG4tX0RV5dYAlzs/550fMkQW4roRG+e7mqEOUaWYQpy+A2w00mCW64knslt/JKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOP2GQK+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOP2GQK+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59BB3C433C7;
	Sun, 18 Feb 2024 10:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708251476;
	bh=0/tCSHJoXcIQWsBkaehDRK6Abciqk6UyuzITcVPRxMI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KOP2GQK+h008NWqvqiX9/SbHiXeHuTTrGWlBlgXyBz12iAlhPDJq0LeCi+yqVaIXt
	 +LXKa4zVMw/rTgariSp+nz1AnSoAq47uGprtAjzrmyyhunELW4B6CFc+UB8G/AHjeH
	 wXKzBd/DU/yGUQbpxuL+/gZglJto5XONWIFiJElX21Cn82aV9ebF9spM23vtVtAYGT
	 Ecj/95FiA0jjM7Wf4URPfjXYMsgZJmL4kV7gSJRPQpWQlODFjwHAfT/UWQFYfs++41
	 4y3zkMwZGjWnvcP53MubWU9tpk53OrrlsYBdSDnyNFmwB74zp7IZl8TbmItTPGs5/5
	 CTVntp7qvBkNA==
Date: Sun, 18 Feb 2024 11:17:52 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Vegard Nossum
 <vegard.nossum@oracle.com>, linux-doc@vger.kernel.org
Subject: Re: PDF misery
Message-ID: <20240218111752.45cd9b8a@coco.lan>
In-Reply-To: <64908dd3-17c9-47e3-a076-d78105fb823b@gmail.com>
References: <8734tqsrt7.fsf@meer.lwn.net>
	<64908dd3-17c9-47e3-a076-d78105fb823b@gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 18 Feb 2024 18:58:47 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> Hi Jon,
> 
> A few comments on PDF of CJK docs. 
> 
> On Sat, 17 Feb 2024 14:29:24 -0700, Jonathan Corbet wrote:
> > [...]
> > 
> > The *other* problem is that PDF generation of the Chinese, Korean, or
> > Japanese translations fails with:
> > 
> >   xdvipdfmx:fatal: Invalid TTC index number
> > 
> > This, I am thinking, is likely some sort of F39 bug.  xdvipdfmx is
> > finding the CJK fonts just fine, but then something clearly goes wrong.
> > I'll try to find the time to narrow that down and perhaps put in a
> > proper bug report.  
> 
> I think this is because xdvipdfmx accesses NotoSansCJK-VF.ttc, which is
> a variable font.  xdvipdfmx/xetex can't work with such fonts (yet).
> See note at the bottom for more info on variable fonts support.
> 
> It sounds like you have google-noto-sans-cjk-vf-fonts installed on your
> system besides google-noto-sans-cjk-fonts.
> 
> What does
> 
>     fc-list | grep NotoSansCJK-VF.ttc
> 
> say?
> 
> I'm wondering why xdvipdfmx behaves that way despite the fontconfig
> setting with:
> 
>         fc-match "Noto Sans CJK SC"
> 
>     returning:
> 
>         NotoSansCJK-Regular.ttc: "Noto Sans CJK SC" "Regular"
> 
> This might be a bug in xdvipdfmx worth reporting.  Or there might
> be glitches in the fontconfig setting.
> 
> 
> Uninstalling google-noto-sans-cjk-vf-fonts (and
> google-noto-serif-cjk-vf-fonts in case you have it) should resolve
> the issue for you, that is if you can safely uninstall it/them.

Tried the above on my desktop with Fedora 39:

<snip>
$ fc-list | grep NotoSansCJK-VF.ttc
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK TC:style=Bold
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK SC:style=Bold
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK HK:style=Bold
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK KR:style=Bold
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK JP:style=Bold
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK TC:style=Black
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK SC:style=Black
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK KR:style=Black
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK HK:style=Black
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK JP:style=Black
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK KR
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK HK
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK JP
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK TC
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK SC
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK JP:style=Thin,Regular
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK HK:style=Thin,Regular
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK KR:style=Thin,Regular
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK TC:style=Thin,Regular
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK SC:style=Thin,Regular
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK SC:style=Regular
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK TC:style=Regular
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK JP:style=Regular
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK HK:style=Regular
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK KR:style=Regular
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK TC:style=DemiLight
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK SC:style=DemiLight
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK TC:style=Light
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK SC:style=Light
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK JP:style=DemiLight
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK TC:style=Medium
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK HK:style=DemiLight
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK KR:style=DemiLight
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK JP:style=Light
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK SC:style=Medium
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK KR:style=Light
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK HK:style=Light
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK HK:style=Medium
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK KR:style=Medium
/usr/share/fonts/google-noto-sans-cjk-vf-fonts/NotoSansCJK-VF.ttc: Noto Sans CJK JP:style=Medium
$ fc-match "Noto Sans CJK SC"
NotoSansCJK-VF.ttc: "Noto Sans CJK SC" "Regular"
$ sudo dnf remove google-noto-sans-cjk-vf-fonts google-noto-serif-cjk-vf-fonts -y
...
Removed:
  default-fonts-cjk-sans-4.0-9.fc39.noarch              default-fonts-cjk-serif-4.0-9.fc39.noarch  google-noto-sans-cjk-vf-fonts-1:2.004-5.fc39.noarch 
  google-noto-serif-cjk-vf-fonts-1:2.002-2.fc39.noarch 

Done!
$ fc-list | grep NotoSansCJK-VF.ttc
$ fc-match "Noto Sans CJK SC"
Vera.ttf: "Bitstream Vera Sans" "Regular"
</snip>

Thanks,
Mauro
