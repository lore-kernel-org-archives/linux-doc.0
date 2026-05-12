Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFF027A907
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 01:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778550426; cv=pass; b=YOe4n+e4+8mIPCc3jb+EKxh9DO28LPNW62kfys2kXc5L76xXmUQwbC270q/yehR31oAFS4NeNgHDXLshCp8pjAKkEyhYBfmfdfwnmHfLZ+O2hrhIb2Qw8/pb6HpNa//OTfNMFtHNTWdmYyiA2yI0IEhDQryk3bSwtRNiFIdcNXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778550426; c=relaxed/simple;
	bh=+nyjZCDAwF0QjimVoTdB1F3e4hI9equawyVNGhNT8QA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MuiuEfBFqRlsleUT33733bLlM4qRz+7w8wMYfUAZCBfp6oJoyD3aK6lekoMujhdfYE6Tm61caZR4ZegEBpI4zqLCtwEMCTJ07h2TsRqVmw/jXJ9fT0nGoYgKnq6SaWCh3N4+qOq/u3LBeP2j50FWVNh3wpripZSUjPFtoZ4Alc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H16FwQF5; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H16FwQF5"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6530287803cso5053218d50.1
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 18:47:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778550424; cv=none;
        d=google.com; s=arc-20240605;
        b=kLUeIG8hewbYzr83Kl1D3U9GzIkwM6qT5rKsUJc0iFJjNKChwANSpeLDN10Uu4oV05
         4d/PUrKq6TDm6tlnU9Ly2+ZYLQvHWwUjSTHyoJiaBNUGegR6sh0H3rzQyS6H9giTg6KQ
         U+/kg3kJnrcn/wcz3FoELJiWH6caoz8reLB4+3wznIh7I0wVd1WK4rt9SVZaGEqMKg3B
         TVlSvW0BQ+sswTH9WwR/KoRk4hlciiAfCrjNSwfU+qpRd+yki76nDJCT0ISDsEex3Zeb
         9fNMhGgKr7BmfeQB61sS8X+1Ql0yDbGAUkYVjoAXpW2hn2nqAK9FeVPxV07sqQ+sPTQD
         pZag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FwpxFc9Afr8dUopKAPOlu3pFs1eNc9ld1yrbloSYHCM=;
        fh=G7vXaNyQ4aCKZDWmkFO61EX8HuuCC4SAEY52r+6A0M0=;
        b=b0yWr+JqkC2PuiPYLmmOpyDotffVat1QSlbbIuLyvvZQFaofooFJ++VXxYzPcdVq0t
         lDiZ36Vmisl74OpYsBf20npIAt9lF6JGCR3T3zx5hJbwtRgxZHONfeqVunSs6RFX4p0O
         8uDiD5j9J5RMD+w5iczzhTaC2CsZOl8U80dNmgnfQIPl6fLrKWeKM2Mb+IwC9gqvVhW/
         FLOZWL2ESQiLfUa36I9OU2qZxUe/zhInFzNAVcV1tbDRjZ6P0OpQCJhHiCvc8NIvzl/Q
         VMIVeNBCXUm6Qy0gaNliKOOEB0q5osSEcYNyt43Z7gk9SR8tPfcJ9ZRQzdzjAEMrCdQ7
         nqbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778550424; x=1779155224; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwpxFc9Afr8dUopKAPOlu3pFs1eNc9ld1yrbloSYHCM=;
        b=H16FwQF5/9qm4FxsSHt8vYbmOGki8VjdKMzt/fPrXPqdo0iXF/EwOf+n6adI3xVORS
         kZE3/a2sk2s7Bh42gw+6EhxPkCnwSOroFMZ1IrA7HU+1Bjv4ntahrpv/O6sPYa7HOKR3
         s/PEcxDzFjPGxS4+wMc/Z2g+1YVEcyO5KOoEONglyTx1Go73M6i53eZGNC0peEQsgcKR
         8lsMa6rvCSYRIOgRnm+PW32uEWljmFGmPP5XS6+X+xGI+AtymDsFDvMnJBGSKWAD6fHm
         NbG7yhaegk9TJOzp1F+VSNYQ2jXY1eTRoPPysuo6lf6omEIZ6uZhhry4khnZQxm+JQqR
         8Rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778550424; x=1779155224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FwpxFc9Afr8dUopKAPOlu3pFs1eNc9ld1yrbloSYHCM=;
        b=ewjUfzwyjzSmw5VPkBqUWxEbOf2Eo5es7LwN+X3EqkykUQ8+YFGW7F6XiP7qA/7Pxv
         Va2MIXWZOxXPgdENJlEsjYVXAUUnxtDlxTX6boodUUVMKHcqiQSe7Dd6PZ7l3UnOXmxq
         FHoO5uojvucO6yEpvSzyGQeo1eqj75hjkoZM+Bb3wLFHwhLmjwjK9f6pYK8Djqx9Wd0d
         ALT69dC6+ri32B1uN0QLVGM/XEDxf9A+QdPZEsIhjfF2IzErM+/pbEgOqPsf27I1x9Ni
         s0SuXcs8zyHZjvvUpBq4DvoVJGbzQXJfUYycLj9NzgG34SohNxltKMe26PrR9g1obspu
         BIQw==
X-Forwarded-Encrypted: i=1; AFNElJ9/vzWHPfKhpOM/WjbeAaqN8AkYUKg5GD4IatfolketnUdFQbuQHm3QIlOrH7Osdem53jVRWMiuP3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS1g8oZBCoGoGpFIOVS59DmXP+QD5Tk/LmkiqxOleIAxEpCjsb
	23YNub1aHtuvrOTFrCPe1Xgj0sMyQzteJaIvFaUtrtYGKsDa21yaLvJlKoyxMoRKK1bLmGzhq+g
	Kt6OkLcGQnbl5zbWo53fDx/+8ZW7eia0=
X-Gm-Gg: Acq92OEPFmPQv65qgDRDpRMyCZb/0IZnPiTVVWhHzYv6y3ZEOITPxfwCMXtY+eml1X+
	Il4B7Iws+Nu9Gj4DotGgel8IZgH+w9RwsTq0zl2HgCxw+kRHjmB13ksaLHy3fEdkCqfYeldCxDa
	Fg4lT55Xf/k8KWCAptzRDELpKrcIIoCCwQXFZ5ozQeIpGlvieO+9ShTKh7GoN3IAeN01wA3hRIz
	SgQ9x9ld1SOr17ol0b0d1wwGm/ilLQYzb2pWgW6rnHU6mzdjl2RhfdocrE9dIet6ATPYy6kyHaY
	m1QST/K6
X-Received: by 2002:a05:690e:d07:b0:65d:6eeb:cbfa with SMTP id
 956f58d0204a3-65da842b927mr11122281d50.27.1778550424368; Mon, 11 May 2026
 18:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_7ADF2D1EBD8EAD2028BC93BA7858EA655D0A@qq.com> <202605111009.hlpiVkT6-lkp@intel.com>
In-Reply-To: <202605111009.hlpiVkT6-lkp@intel.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Tue, 12 May 2026 09:46:38 +0800
X-Gm-Features: AVHnY4Jtlo9H5C7tKgKhoHGPG68VMovdXjvGsxYCqTw1nW1WDBGKDVoH7Bpz5ow
Message-ID: <CAD-N9QU8e1tHoZ0Dsqpz0Vb6GYUu-7bDYYuz9rH52s=6pizXRw@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: update admin-guide/index.rst translation
To: kernel test robot <lkp@intel.com>
Cc: Yan Zhu <zhuyan2015@qq.com>, corbet@lwn.net, alexs@kernel.org, 
	si.yanteng@linux.dev, kees@kernel.org, oe-kbuild-all@lists.linux.dev, 
	skhan@linuxfoundation.org, dzm91@hust.edu.cn, tony.luck@intel.com, 
	gpiccoli@igalia.com, frederic@kernel.org, jani.nikula@intel.com, 
	longman@redhat.com, mchehab+huawei@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 4:53=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Yan,
>

Hi Yan,

Please take a look at this testing report and verify if it is correct
or false alarm.

Dongliang Mu

> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on lwn/docs-next]
> [also build test WARNING on linus/master v7.1-rc3 next-20260508]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yan-Zhu/docs-zh_CN=
-update-admin-guide-index-rst-translation/20260511-102406
> base:   git://git.lwn.net/linux.git docs-next
> patch link:    https://lore.kernel.org/r/tencent_7ADF2D1EBD8EAD2028BC93BA=
7858EA655D0A%40qq.com
> patch subject: [PATCH] docs/zh_CN: update admin-guide/index.rst translati=
on
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce: (https://download.01.org/0day-ci/archive/20260511/202605111009=
.hlpiVkT6-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605111009.hlpiVkT6-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    Checksumming on output with GSO
>    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
>    MAINTAINERS:40: WARNING: Inline strong start-string without end-string=
. [docutils]
> >> Documentation/translations/zh_CN/admin-guide/index.rst:114: WARNING: t=
octree contains reference to nonexisting document 'translations/zh_CN/admin=
-guide/module-signing' [toc.not_readable]
>    Documentation/userspace-api/landlock:504: ./security/landlock/errata/a=
bi-4.h:5: ERROR: Unexpected section title.
>
>
> vim +114 Documentation/translations/zh_CN/admin-guide/index.rst
>
>    113
>  > 114  .. toctree::
>    115     :maxdepth: 1
>    116
>    117     cpu-load
>    118     mm/index
>    119     module-signing
>    120     numastat
>    121
>    122
>    123  Todolist:
>    124
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
