Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2392A146A79
	for <linux-doc@vger.kernel.org>; Tue, 30 Jul 2024 03:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722311648; cv=none; b=pKXo/hgQmh+tvAyJjVxvxTCQNzW/HnT+ynuwBEQgDUXOK4eebiMisqFb4/7i5esRWFddwADFCoJ/HPblifJK4tVge0q5dK4qlDMREZVlSYBrnmM8lrMtQ/UeAGUI/qp0yTOONbx+bIUehq1y8pMIlo74kLZjyta9co7G2EUedSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722311648; c=relaxed/simple;
	bh=E1pEfdyR6kjbhVV3NfB4TZ4buDsY8BPr6TEvfS/3EXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VotCDx/DMcfdKJQLd/CpAphQbFHvYfDkXgGenoLmDpYAVz4l8POABYp9IBaPKXN3B/GZP1D10lyJzuwwzL6ogmjWfSSAg8qNVGmoGZNaGbp2iNH1u3ox49gogt4+QVueeqffnwPYdZ83HJoO63PPoD1CcdJ1Bz70fE6R0eR3uhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MkPP6Act; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkPP6Act"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5d5bb2ac2ddso1887120eaf.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jul 2024 20:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722311646; x=1722916446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnDGx7qmklgbXgUTSkMGiYMoIqr1aBMkQxJCxk3Reyk=;
        b=MkPP6ActH1Tns1NxOFP4fQxbBEKXyY0D18xKEhwBzgYFSwouIDGULN0fAvCNxe7Hij
         ar5JSi3yg9i5W347bj//lI6reV5lGXtYmkJpaw5Z0IxTGxKRLiCIP8KLEYPUlOE3KtyA
         c0bJk0RbwRYg7reb6q4dkN73To7zj/93pc3yIl0AY8TLm3bWwPstZvkhSsZkSAZo1QnF
         cUqqK7Kf2SgpUR48i+9daZT46HiTuN3OCtlnGiCLtgeOHLeCRiBqopy4TPvol6YCEmoH
         voLL0+zRqTgF3flgxqoIoSbRsQCEDGxoVspxnjV8M2/LnrZZk/j2BVBC9ylKDewNNzF1
         ctZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722311646; x=1722916446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OnDGx7qmklgbXgUTSkMGiYMoIqr1aBMkQxJCxk3Reyk=;
        b=URm5UXOmSPNh83ZIld2CNT0apSAZD5/Ru2NwHz5LZN9uP90m/TB4rjftIIBkfsdUBr
         k7nXWTG+8w5zv2gstEgdFuU/9L6rx4eIkokqde4d5bzufo7dGNfXnKzMPa7nURUAvAK8
         Zfq6QaH/NmHN6zoXzme2vkliQXs5q1dX/WYVYbsd97E2bPaWoKgDm3yjxSmhTKSmistI
         4OXC4/Xt7vVyjBlH4/MrYv4TmEEh1U17CHFwFB+X1WXqGloif24Whn2w2ipspGIL1rHv
         JvIZoSXhLqpFVtaflyK69Rju90S2OA4k3GaLnYQlltiOfWgWONl9/Hl3jQDaQhDppMnO
         yXwg==
X-Forwarded-Encrypted: i=1; AJvYcCWlvbv9+3jSpo2TyeRrJ2BPgQ3RSrFSTl6M7ZL0At6gnmz/HfOFZuoMMM577bO28qNoIXNvFkVgrso/XhLAtqpm20THesDh2F/K
X-Gm-Message-State: AOJu0YxkMsKYC8HNfEYzVNomKA7o+yvQ4YtDbilXASZvFYw7sWBz3R8i
	UFpN9Crxj72WC75t3s2m9xpCRLOBLzP53xRlLdIkauA7nkoixQuecFP5EaI+YajULVVWKOBGavu
	HUtTI1Ww3IDDEXgIK2H0jXzIdM3Zlv3G9MCk=
X-Google-Smtp-Source: AGHT+IEix7+Kdd9xJYVjKhlzKY+sffwouAnzxFhKguuMc2IgGOzgB/BAXb5CFcn22c5gKtun4hEBqKw32D4j+TfoJsg=
X-Received: by 2002:a05:6820:614:b0:5ce:3ccb:2118 with SMTP id
 006d021491bc7-5d605e01115mr326090eaf.3.1722311646149; Mon, 29 Jul 2024
 20:54:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202407300812.1VvDFdxD-lkp@intel.com>
In-Reply-To: <202407300812.1VvDFdxD-lkp@intel.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Tue, 30 Jul 2024 11:53:40 +0800
Message-ID: <CAD-N9QW=6CbbzM4G_hoB-boMazDR5MGm6D3thPe6y=F05cNdJg@mail.gmail.com>
Subject: Re: [lwn:docs-next 2/8] htmldocs: Warning: Documentation/translations/zh_CN/kbuild/index.rst
 references a file that doesn't exist: Documentation/kbuild/index
To: kernel test robot <lkp@intel.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, oe-kbuild-all@lists.linux.dev, 
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 8:59=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   git://git.lwn.net/linux.git docs-next
> head:   60666fbc81ac91af2cf2f511d60859288f7ea8e5
> commit: e6a5af90f0a24f08445e3b8a11b727ac84a9520c [2/8] docs/zh_CN: add th=
e translation of kbuild/headers_install.rst
> reproduce: (https://download.01.org/0day-ci/archive/20240730/202407300812=
.1VvDFdxD-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407300812.1VvDFdxD-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    Warning: Documentation/devicetree/bindings/power/wakeup-source.txt ref=
erences a file that doesn't exist: Documentation/devicetree/bindings/input/=
qcom,pm8xxx-keypad.txt
>    Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm57=
03-regulator.yaml references a file that doesn't exist: Documentation/devic=
etree/bindings/mfd/siliconmitus,sm5703.yaml
>    Warning: Documentation/hwmon/g762.rst references a file that doesn't e=
xist: Documentation/devicetree/bindings/hwmon/g762.txt
> >> Warning: Documentation/translations/zh_CN/kbuild/index.rst references =
a file that doesn't exist: Documentation/kbuild/index

This is my problem.

But curious: why does my local `make htmldocs` not report this issue?
I tested it locally again, but no such warning is reported.

I will send a patch to fix this issue.

Dongliang Mu

>    Warning: MAINTAINERS references a file that doesn't exist: Documentati=
on/devicetree/bindings/reserved-memory/qcom
>    Warning: MAINTAINERS references a file that doesn't exist: Documentati=
on/devicetree/bindings/display/exynos/
>    Warning: MAINTAINERS references a file that doesn't exist: Documentati=
on/devicetree/bindings/misc/fsl,qoriq-mc.txt
>    Using alabaster theme
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
