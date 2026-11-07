Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794057418;
	b=Jq/02r7tUYwHJBJkShmi9xqMJdV8X+DVUoV7on2q9C44bMJVg9thmc9WK3GtSrSP25+f
	 Le+IEac5l0isuhtseh6h2O3F8ZKg+iAloANi7K3wPioNtEPoWfycbsJ6MwEsU4tFiTR2V
	 6rFZ23FrFPNWBLyKJRPRKGA3jFpcbpF+3zJmTzac32oeOxwhewKzKDM+gYFWl1cl5CcYy
	 /cNTIojQds+f5+SVLLd9XHlKXVTEWxJNL7Npke+dVUOAshOu+wxOYsDFRBFE8BY99xWoI
	 WypaWU1rvCNoTZYS6d1KUuscUpkb05YEmCXQFDkY9JaF4OiH9C9NOGH8j3U968YFeiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ITJCB8gx6g7h4yesiUK+wUqktOJu62TLqR0BJm5nLyw=;
	b=sjAnJHdmHyEPWQmdZOCcMKiy/IQC33Dddsdk0cGIROxY83PJUdgrleh66UUa108ylldY
	 j+fmMQ7MmNQDFzyX0ievHS4jwPgALZe4myj/+HjwO7Gp4Xk7qpNV6nsidJHpHufYmtILR
	 O5W8hfglmejEEHO+bX4+ZTFyxBVErdErYnUNiksFckOlhzC0FCT5I+mSG+7gf+u+cY+T2
	 N4KJIu1CgikPMhJhWD/UYpddOwrTF3aM/zBURL/klRqqFkkzo73WcWRhd07mHSeWoxnOi
	 KyCrp5kTiOto+xxav2RwMLvhVKIrAOqqI0pEUorF0f8ShwTXh43qFrNe3rXu0i/YJhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J760k2up;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C0C606A32D
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 13:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72C0C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J760k2up
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b577addee9so1807679a12.1
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 05:16:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794057416; cv=none;
        d=google.com; s=arc-20260327;
        b=Ay0T7PmvxIiqrmRMaPkbIJ//C3NTdJNNcA01l961jepnL7k0moQE8TFWXeYRwpZpkd
         QdS/DrGLoHyFyXbx6zd+sbx23sVadLq0HYGh8E1vM5EeYAPO+Pp3wEmnQ0n6iUz7jbY2
         H0gyBomewYqN4Lxv8tAzws4AVDtfQ3HyhjONY2UdXWbhBJLP2GFwd6RqeQwci7uqn61s
         470QtkS3jl6z1aPtv+y582ArMY86QDoIJdrHBWxk0ZiXZ8jAwisXoRufD8XWzwQ6RRQ/
         h+wUbo85JT9QVWuz179SuO1KrYwmNCxTbnLu4ZZISuc4FdhfuyzszA4acW8+VueT1f/U
         /56w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ITJCB8gx6g7h4yesiUK+wUqktOJu62TLqR0BJm5nLyw=;
        fh=u5wE7lpdSUEtRl1PxR2UvCAJszR1IK+Bh2+iuga3w60=;
        b=q5yd43Puw+Mr3iqdSIfZxKqCt+I2r94lHWASe8/kBNmWmwDfRGZ2BAYWYESQMPE+FT
         DZQUhlBylBS0YAr0XYrxFlveKnujKT1lrZmNZHCobPvpSqMLjh/7sbpm/gNWs2F3DgOw
         3ozCNE9aQYUmscEkFNw4tmJyvWMvDQKFA1jhqYTJn6bnRaaNJ8ptvqIKa7NpB7Xk+Dhn
         /nD9UbfynOR8ojW7NRqBVXrHrleRU0FeMuviEAC5xYd9rpwWZA3t78kWlIwx3nkTRMZT
         lDCfwQ+CYEoYwmn8eLP2cdndm46dQgIoU11jERQY/HJ6y0qMX/MYnywcGl34nZ7Sy7C0
         JF0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794057416; x=1794662216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ITJCB8gx6g7h4yesiUK+wUqktOJu62TLqR0BJm5nLyw=;
        b=J760k2upP530YTR6JC/XKT38ble9wJPej8ZvzOBjT1or6HD87l8qiafXr6qx3UjfQw
         HJEQbEat2ZUxbYxLabzcKd7N6fV8opvf/KQnyjH3RNnN3Y9+25x9StBTXdO5rmMyLzwb
         17z186zF5yB0v/rZtfrHt77j3SNOj9bZD1YcHRVuEh3WcJE61b8LgeETslERbZ0NMMmm
         wumuaUKy8ayZVgtw/0MtH0gpGytFDCrDi/jw2+cf5sXYDMqRWYemVXRDGalI853ISOkr
         5JVwZkQlncoJa0J7KFW7xV15qIM9TgOL/5yYPrebBRn4FLAyHiXxGkms+bnFeFMIJnqJ
         ZkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794057416; x=1794662216;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITJCB8gx6g7h4yesiUK+wUqktOJu62TLqR0BJm5nLyw=;
        b=i53wZQ78fNBNUOYdrvzw9ueiMfKt88EIIhFXMTeCWQCi0gfonbyDtNHUgL8p05tsan
         sMkzqVEFyQ3r+a3ihWO4jlifiVeP9eN46/Kh4SJyRjA/AXjwYIffDlAO4euD8eXol0Ia
         7VEDspMk63dqROkSGj80fn1Zbx6GuyHv46YVBnWBPmZ1elrEG7gRZMtlG8c+8H3z7p8f
         dSRCgQn30AvN/We0Uf6upefDRJAXqaJsQft9VaC5qhR3N9gTSvHn7LZlv5wrt3j/ZLWB
         bfBff6Mk1ySiMgXSWmDlgEcdk/lJF0Vs8RwNpMDl6XHFKDVOsnDFwrvnlX8QRtSNEQbP
         1WYg==
X-Gm-Message-State: APuU4Z/sTkoMM1ebweGbDl9U+T1hyzPlVevx+DQzIPlEEcC9ytM1pxje
	ZPhs3SpIgo6bLAjKOBPvaGDHrwDgKlN6LqUm2X6y1hgZq+9qOMgHJhbVj8T90X00lsJRJUz5VPU
	ei5T8p1GfZFx+pv0fUc2Ns455kZ8SuZw=
X-Gm-Gg: AYBFou3lGipcdrU7w6ic8lcAi6QLyurEDUnlUHwdyzWevv5j/dBCRpYmJ+fe2Eqr99X
	mvLA+/3hKz4GxbpV1F4yNzHfZuNn7ezlLgPXq8kJrQHAulSfKDPQMXlj4/xbfjNHX+bXVstlCdN
	bOyVYcAloOP23n246YGWU4Cwkim2QWnw6OZS7yvsFWdKyHrQcAM/AVC+izn9sEvEjExtv8nF4eH
	GCvNAn8MAvTui6RK0GgrclUw0H8WY6gGLAL19/S8WrHJurdTNYoAP9Tum4Szfbv00ly4QuhT9HL
	uPP3Vi0PNKoy5ZAiP/5RcpLm6Yyz8hvgpKj/XMlYsocKoLsYdNSu6Bkm1KlzDKDy7nAnWe/FDBY
	5sX8AYcBx9aIzH/3d0nYg9zL52J4tv62KkpBlpgOJhWNXnGw9Jlitufi/3dB1UyiriFUBPtlY20
	tFjj4jYjxpF9M=
X-Received: by 2002:a05:6402:3603:b0:6b4:66c9:92c7 with SMTP id
 4fb4d7f45d1cf-6b5977e0fe7mr3669140a12.24.1794057415577; Sat, 07 Nov 2026
 05:16:55 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <au8heODCJCmmCWKA@wyuan.org>
In-Reply-To: <au8heODCJCmmCWKA@wyuan.org>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Sat, 7 Nov 2026 21:16:29 +0800
X-Gm-Features: AclHuK9U3nqyhpd5rdw-dasJW6Uvt22Hw3FhngmOa4eIX2VxEq26sjEwy2JZzQ0
Message-ID: <CAD-N9QU4tWCoXyt0onyRtSOM_kK-MHRmJyjjNDg7YRsq033yiQ@mail.gmail.com>
Subject: Re: What's cooking in Chinese docs (Nov 2026, #02)
To: Weijie Yuan <kernel@wyuan.org>
Cc: linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>, 
	Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 9:03=E2=80=AFPM Weijie Yuan <kernel@wyuan.org> wrote=
:
>
> Here are the topics for Chinese docs waiting to be merged.

It seems this cooking has some delay for review collection.

>
> Copies of the source code to Chinese documentation development tree live
> in here:
>
>     git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
>     https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
>     https://kernel.googlesource.com/pub/scm/linux/kernel/git/alexs/linux.=
git
>
> Mirrors:
>
>     https://mirrors.hust.edu.cn/git/kernel-doc-zh.git
>     https://mirror.nju.edu.cn/git/kernel-doc-zh.git (experimental)
>
> Please report any mirror instability to linux-doc@vger.kernel.org
>
> -------------------------------------------------------------------
> [Cooking]
>
> * Chen-Yu Yeh 2026-11-06
>   [PATCH 00/13] docs/zh_TW: process: add translations of 13 documents
>   [PATCH 01/13] docs/zh_TW: process: add researcher-guidelines.rst transl=
ation
>   [PATCH 02/13] docs/zh_TW: process: add cve.rst translation
>   [PATCH 03/13] docs/zh_TW: process: add applying-patches.rst translation
>   [PATCH 04/13] docs/zh_TW: process: add maintainer-pgp-guide.rst transla=
tion
>   [PATCH 05/13] docs/zh_TW: process: add changes.rst translation
>   [PATCH 06/13] docs/zh_TW: process: add handling-regressions.rst transla=
tion
>   [PATCH 07/13] docs/zh_TW: process: add deprecated.rst translation
>   [PATCH 08/13] docs/zh_TW: process: add kernel-docs.rst translation
>   [PATCH 09/13] docs/zh_TW: process: add maintainer-handbooks.rst transla=
tion
>   [PATCH 10/13] docs/zh_TW: process: add contribution-maturity-model.rst =
translation
>   [PATCH 11/13] docs/zh_TW: process: add conclave.rst translation
>   [PATCH 12/13] docs/zh_TW: process: add threat-model.rst translation
>   [PATCH 13/13] docs/zh_TW: process: add maintainers.rst translation
>
>   Needs review.
>   cf. <3bbce43f-476c-4a21-8da3-2be98a696e9c@hust.edu.cn>
>   source: <20261106113545.708896-1-chenyou910331@gmail.com>
I have comments on this patchset half an hour before
>
>
> * Chen-Yu Yeh 2026-11-06
>   [PATCH 00/25] docs/zh_TW: process: resync translations with the English=
 originals
>   [PATCH 01/25] docs/zh_TW: process: sync 1.Intro.rst with the English or=
iginal
>   [PATCH 02/25] docs/zh_TW: process: sync 2.Process.rst with the English =
original
>   [PATCH 03/25] docs/zh_TW: process: sync 4.Coding.rst with the English o=
riginal
>   [PATCH 04/25] docs/zh_TW: process: sync 5.Posting.rst with the English =
original
>   [PATCH 05/25] docs/zh_TW: process: sync 6.Followthrough.rst with the En=
glish original
>   [PATCH 06/25] docs/zh_TW: process: sync 7.AdvancedTopics.rst with the E=
nglish original
>   [PATCH 07/25] docs/zh_TW: process: sync 8.Conclusion.rst with the Engli=
sh original
>   [PATCH 08/25] docs/zh_TW: process: sync code-of-conduct-interpretation.=
rst with the English original
>   [PATCH 09/25] docs/zh_TW: process: sync code-of-conduct.rst with the En=
glish original
>   [PATCH 10/25] docs/zh_TW: process: sync gdb-kernel-debugging.rst with t=
he English original
>   [PATCH 11/25] docs/zh_TW: process: sync development-process.rst with th=
e English original
>   [PATCH 12/25] docs/zh_TW: process: sync email-clients.rst with the Engl=
ish original
>   [PATCH 13/25] docs/zh_TW: process: sync kernel-driver-statement.rst wit=
h the English original
>   [PATCH 14/25] docs/zh_TW: process: sync kernel-enforcement-statement.rs=
t with the English original
>   [PATCH 15/25] docs/zh_TW: process: sync management-style.rst with the E=
nglish original
>   [PATCH 16/25] docs/zh_TW: process: sync security-bugs.rst with the Engl=
ish original
>   [PATCH 17/25] docs/zh_TW: process: sync volatile-considered-harmful.rst=
 with the English original
>   [PATCH 18/25] docs/zh_TW: process: sync 3.Early-stage.rst with the Engl=
ish original
>   [PATCH 19/25] docs/zh_TW: process: sync coding-style.rst with the Engli=
sh original
>   [PATCH 20/25] docs/zh_TW: process: sync embargoed-hardware-issues.rst w=
ith the English original
>   [PATCH 21/25] docs/zh_TW: process: sync howto.rst with the English orig=
inal
>   [PATCH 22/25] docs/zh_TW: process: sync license-rules.rst with the Engl=
ish original
>   [PATCH 23/25] docs/zh_TW: process: sync stable-api-nonsense.rst with th=
e English original
>   [PATCH 24/25] docs/zh_TW: process: sync submit-checklist.rst with the E=
nglish original
>   [PATCH 25/25] docs/zh_TW: process: sync submitting-patches.rst with the=
 English original
>
>   Needs review.
>   source: <20261106113142.706783-1-chenyou910331@gmail.com>
>
>
> * Weijie Yuan 2026-10-30
>   [PATCH v2] docs/zh_TW: drop unused enforcement statement label
>
>   Will queue?
>   source: <auQwssHcQiM09SDd@wyuan.org>
>
>
> * Dongliang Mu 2026-10-29
>   [PATCH v3 0/9] docs/zh_CN: align translation paths and update guides
>   [PATCH v3 1/9] docs/zh_CN: update admin-guide/index.rst translation
>   [PATCH v3 2/9] docs/zh_CN: update admin-guide/README.rst translation
>   [PATCH v3 3/9] docs/zh_CN: add media administrator guide translations
>   [PATCH v3 4/9] docs/zh_CN: reorganize process debugging guides
>   [PATCH v3 5/9] docs/zh_CN: update magic-number to match upstream
>   [PATCH v3 6/9] docs/zh_CN: reorganize media driver API translations
>   [PATCH v3 7/9] docs/zh_CN: move GFS2 translations into filesystems/gfs2
>   [PATCH v3 8/9] docs/zh_CN: update networking/xfrm/xfrm_proc.rst transla=
tion
>   [PATCH v3 9/9] docs/zh_CN: remove stale Original fields from SCSI and I=
PE translations
>
>   Reviewed by Yanteng.
>   source: <20261029124429.294868-1-dzm91@hust.edu.cn>
>
>
> * Jiandong Qiu 2026-10-29
>   [PATCH v4 0/2] docs/zh_CN: update translation of doc-guide/sphinx.rst
>   [PATCH v4 1/2] docs/zh_CN: add process/changes.rst translation
>   [PATCH v4 2/2] docs/zh_CN: update sphinx.rst translation
>
>   Reviewed by Dongliang.
>   source: <cover.1793279600.git.qiujiandong1998@gmail.com>
>
>
> * Yao Yiqi 2026-10-22
>   [PATCH] docs/zh_CN: fix typos in admin-guide/README
>
>   Reviewed by Dongliang.
>   source: <20261022135949.361566-1-yyaqia@gmail.com>
>
>
> * Yikun Wei 2026-10-20
>   [PATCH v3 0/5] docs/zh_CN: add fault-injection Chinese translations
>   [PATCH v3 1/5] docs/zh_CN: add fault-injection index Chinese translatio=
n
>   [PATCH v3 2/5] docs/zh_CN: add fault-injection Chinese translation
>   [PATCH v3 3/5] docs/zh_CN: add notifier-error-inject Chinese translatio=
n
>   [PATCH v3 4/5] docs/zh_CN: add nvme-fault-injection Chinese translation
>   [PATCH v3 5/5] docs/zh_CN: add provoke-crashes
>
>   Expecting a reroll. (thread broken)
>   cf. <6baba360-6ee2-4195-91e4-d22c97d3c146@hust.edu.cn>
>   source: <SI2PPFCA6543649A166AABA54D11A931F7DDD672@SI2PPFCA6543649.apcpr=
d04.prod.outlook.com>
>
>
> * Weijie Yuan 2026-10-21
>   [PATCH v3 0/2] docs/zh_CN: cleanup headers
>   [PATCH v3 1/2] docs/zh_CN: remove translator-related headers
>   [PATCH v3 2/2] docs/zh_CN: remove Translator field in header template
>
>   Partly reviewed by Dongliang with an extra question to Jon.
>   source: <cover.1792569583.git.wy@wyuan.org>
>
>
> * Jiaming Ouyang 2026-10-28
>   [PATCH v4] docs/zh_CN: add Chinese translation for usb/ohci.rst
>
>   Expecting a reroll.
>   cf. <fcabf691-cca4-477d-b387-e50467a41408@hust.edu.cn>
>   source: <20261028072643.32250-1-jiamingouyang13@gmail.com>
>
>
> * Weijie Yuan 2026-09-05
>   [PATCH v2 0/2] docs/zh_CN: update maintainer/configure-git.rst
>   [PATCH v2 1/2] docs/zh_CN: sync maintainer/configure-git with upstream
>   [PATCH v2 2/2] docs/zh_CN: improve maintainer/pull-requests translation
>
>   Needs review.
>   source: <20260905-configure-git-v2-0-ab194db8c6b9@wyuan.org>
This also has my review.
>
>
> * Weijie Yuan 2026-08-23
>   [PATCH v2 0/5] Update maintainer-pgp-guide.rst Chinese translation
>   [PATCH v2 1/5] docs/zh_CN: update maintainer-pgp-guide translation Weij=
ie Yuan
>   [PATCH v2 2/5] docs/zh_CN: clarify free Nitrokey requirements Weijie Yu=
an
>   [PATCH v2 3/5] docs/zh_CN: update maintainer-pgp-guide kernel.org link =
Weijie Yuan
>   [PATCH v2 4/5] docs/zh_CN: add kernel.org trust repository reference We=
ijie Yuan
>   [PATCH v2 5/5] docs/zh_CN: remove empty proofreader field from maintain=
er PGP guide
>
This also has my review.
>   Needs review.
>   source: <20260823-maintainer-pgp-guide-v2-0-bea33b2ece54@wyuan.org>
>
>
> * Yan Zhu 2026-06-12
>   [PATCH 00/10] <cover.1781105672.git.zhuyan2015@qq.com>
>    # Msgid changed
>   [PATCH 00/10] docs/zh_CN: add LSM admin-guide Chinese translation
>                 https://lore.kernel.org/linux-doc/tencent_001080DF135CEE2=
CD1B260EFA08E3CC71A09@qq.com/

A little wired format.

>   [PATCH 01/10] docs/zh_CN: add LSM/index Chinese translation
>   [PATCH 02/10] docs/zh_CN: add LSM/apparmor Chinese translation
>   [PATCH 03/10] docs/zh_CN: add LSM/LoadPin Chinese translation
>   [PATCH 04/10] docs/zh_CN: add LSM/SELinux Chinese translation
>   [PATCH 05/10] docs/zh_CN: add LSM/Smack Chinese translation
>   [PATCH 06/10] docs/zh_CN: add LSM/tomoyo Chinese translation
>   [PATCH 07/10] docs/zh_CN: add LSM/Yama Chinese translation
>   [PATCH 08/10] docs/zh_CN: add LSM/SafeSetID Chinese translation
>   [PATCH 09/10] docs/zh_CN: add LSM/ipe Chinese translation
>   [PATCH 10/10] docs/zh_CN: add LSM/landlock Chinese translation
>
>   Waiting for response.
>   cf. <895533d5-99d7-406e-acc2-1f8659075f91@hust.edu.cn>
>   cf. <440378d6-d72c-4edd-9159-582df02b49e6@hust.edu.cn>
>   cf. <e708b270-3adc-4c7e-a48d-9804faed6c44@hust.edu.cn>
>   source: <tencent_7080BF6BB8F05936649DDC091FFD8C45210A@qq.com>
>
> -------------------------------------------------------------------
> [Queuing] #zh_TW
>
> Queuing for 7.5 merge window.
> Currently here: https://github.com/kernel-zh/linux-zh_TW.git docs-next
> If anyone has any objections, please let us know.
>
> * Chen-Yu Yeh 2026-09-29
>   [PATCH 0/3] docs/zh_TW: mark translations that are not kept in sync
>   [PATCH 1/3] docs/zh_TW: add a notice for translations not kept in sync
>   [PATCH 2/3] docs/zh_TW: mark translations outside the maintained set
>   [PATCH 3/3] docs/zh_TW: link filesystems/ and cpu-freq/ from the index
>
>   Acked by Weijie.
>   source: <20260929131142.266819-1-chenyou910331@gmail.com>
>
>
> * Chen-Yu Yeh 2026-09-29
>   [PATCH] docs/zh_TW: remove the unreachable plain-text translations Chen=
-Yu Yeh
>
>   Acked by Weijie.
>   source: <20260929131109.266535-1-chenyou910331@gmail.com>
>
>
> * Chen-Yu Yeh 2026-09-29
>   [PATCH 0/4] docs/zh_TW: relocate translations to follow the English lay=
out
>   [PATCH 1/4] docs/zh_TW: move security-bugs to process/
>   [PATCH 2/4] docs/zh_TW: move magic-number to staging/
>   [PATCH 3/4] docs/zh_TW: move gdb-kernel-debugging to process/debugging/
>   [PATCH 4/4] docs/zh_TW: add missing :Original: fields
>
>   Reviewed by Weijie.
>   source: <20260929131020.266120-1-chenyou910331@gmail.com>
>
>
> * Chen-Yu Yeh 2026-09-29
>   [PATCH v2 0/7] docs/zh_TW: remove duplicated maintainer contact informa=
tion
>   [PATCH v2 1/7] docs/zh_TW: process: remove maintainer contact informati=
on
>   [PATCH v2 2/7] docs/zh_TW: admin-guide: remove maintainer contact infor=
mation
>   [PATCH v2 3/7] docs/zh_TW: arch: remove maintainer contact information
>   [PATCH v2 4/7] docs/zh_TW: dev-tools: remove maintainer contact informa=
tion
>   [PATCH v2 5/7] docs/zh_TW: filesystems: remove maintainer contact infor=
mation
>   [PATCH v2 6/7] docs/zh_TW: cpu-freq: remove maintainer contact informat=
ion
>   [PATCH v2 7/7] docs/zh_TW: remove the last maintainer contact reference=
s
>
>   Acked by Weijie.
>   source: <20260929115956.229610-1-chenyou910331@gmail.com>
>
> -------------------------------------------------------------------
> [Discarded]
>
> * R=C3=A9nich Bon =C2=B4Ciri=C2=B4c 2026-09-20
>   [PATCH] docs/zh_CN: fix stale :Original: reference in xfrm_proc.rst
>
>   Replaced by Dongliang's <20261029124429.294868-1-dzm91@hust.edu.cn>
>   cf. <20261029124429.294868-9-dzm91@hust.edu.cn>
>   cf. <aus2LTFjmZaZPomM@wyuan.org>
>   source: <20260920073144.546566-1-renich@evalinux.com>
>
>
> * Yukai Wu 2026-08-29
>   [PATCH] docs/zh_CN: Update arch/riscv/vm-layout.rst translation
>
>   Discarded for waiting for too long.
>   source: <20260829041542.256360-1-xiaoyewuz.Ruster@gmail.com>
>
>
> * Chen Miao 2026-08-14
>   [PATCH v4 5/6] docs/zh_CN: doc-guide: document macOS Sphinx setup
>   [PATCH v4 6/6] docs/zh_CN: how-to: document case-sensitive APFS setup
>
>   Discarded for waiting for too long.
>   cf. https://lore.kernel.org/linux-doc/b233295b-64c0-4d50-a0fd-516e4795e=
b96@hust.edu.cn/
>   source: https://lore.kernel.org/linux-doc/b233295b-64c0-4d50-a0fd-516e4=
795eb96@hust.edu.cn/ (PATCH 5/6)
>   source: https://lore.kernel.org/linux-doc/20260814214419.49925-6-chenmi=
ao.ku@gmail.com/ (PATCH 6/6)
>
>
> * Ye Liu 2026-08-19 1 commit
>   [RESEND PATCH v2] docs/zh_CN: sync page_table_check.rst translation
>
>   Discarded for waiting for too long.
>   source: <20260819025535.2967566-1-ye.liu@linux.dev>
>
>
> * Cui Shuang 2026-07-22 1 commit
>   [PATCH v3] docs/zh_CN: Add configurable error injection translation
>
>   Discarded for waiting for too long.
>   source: <20260722123240.22979-1-imcusg@gmail.com>
>
> PS. The copy of this report is here now:
>     https://github.com/kernel-zh/linux-zh_TW.git meta
>
