Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3D86F2F3
	for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 05:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729229605; cv=none; b=LLMLCnY5teQoLjsTF3CBCZQaMMgM+oPpSo7SOY8LbUFKn9ZCGbjqJVPRi4qYyqm4ff0bj24PWyjcB2i+fHRXt3x9+5rD0Ba1m42J2Lb1kASvQ5FVS+6CfkGv+qYHckvxAQk1TPKGHCbdO3PEKx6bXUu29RzpoTjxX1Sy6zqOY6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729229605; c=relaxed/simple;
	bh=ID3QsW84pQ8VezYxAWPksswcXUJytg3ccy4T59c0Nx0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=cNevwdVCAXeE1+oqr7gEL6wvRfBB+H+1+6bt1KFKtNUA1qb7FelNh/p/lbjueAMuL/18X3z60rZ22sSotdNt5JIfhyeCFiIlEdtMOUWBwY9FRtbrgjM7Yh3hg+lLfuTt7dpXHRpi+hYleHCgy95n13+WVrfjS10IZawepV47LOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jOrtoSXO; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jOrtoSXO"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5eb5be68c7dso923671eaf.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Oct 2024 22:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729229603; x=1729834403; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=brs5DN+O8J3rRT7FCjr5E/FN0QK57qQKK5ONE5ZJZig=;
        b=jOrtoSXO08cLnASJv3JXyXU26u5m32R0Wc7DoG0pgYXB+Et0owMZ6EAKYT4vgDjb+U
         tKseYpkiN/bzTfP5tAq3NqWQdnFX98V8r5ed6/nv+gHFfIoWkkEDed0k5S+SshSWmX+2
         Fhhj50qmSd1XB35ZgJ/b5suDB/rb/trCTcN34HqraGyp9FHxt/N2T77xecRDoxUZKBU2
         g5q7lSDPlVshtMKHkvs/z+3qWY+qnzIoDWu7dUBFrrcYO4pXDN8ygbz+g+8W0aA5hu1u
         KLnQrouuECzAJxwjz/IXP7zEonQLKPG7D51PCMsahW+E/Aa1uUckVdogvWgw7pgGmMqz
         aEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729229603; x=1729834403;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brs5DN+O8J3rRT7FCjr5E/FN0QK57qQKK5ONE5ZJZig=;
        b=CgLsB0uFyvcwR5Kk6GOxJRxwueQdHxxboiwicgT0TxsG8B8VZKFeHY79cE/Dl8Pvfq
         7ycRj2pjJ6nObMsFZAyMjLmEgLqr4xlF5C0X66gbPI1m/igYmEsC8iep6LSJrgxC6NQv
         EQyh2Ew7AFULar8y7zjKSfMwGxyvi+zwNgNthfU4z6QLenw2rO+qnJolrRmqDU2ZIiJv
         JeWeB8T3nF2i6uecbEONe3q8yaAtxzOToQ3XAHM0UofZS84fCCb/HkzFYVEdNfeGK3ti
         Y/vJscE5NRnRT6jBcgVR1q4aEyVIiL9wbnxVH4TOFqbI/FlFSLV+xIpML61+smXfGArn
         Okow==
X-Forwarded-Encrypted: i=1; AJvYcCVRTBs/oCRCa875HJczbKQVd3+a4WpKIO3wacVe/nFs+DxYipOdeOnUBQ7bdoyPsFmMHgd26PYteBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLFLBZ9RIWucv9vS4fwR7pBlTKdqEtHO/AWbzAuA9GU7GY7USP
	vMunhlm5NTw4XKrpDJi9UnZb9SOZDAdI7rg/GDBnAk6LnJqHX8hdIFIM63PmsVk5vlnT1X1Rfxh
	UIbV0vQI5f6anEFDGKvDiwj3bJhk=
X-Google-Smtp-Source: AGHT+IHgv7HgIgsqOWgLc5Lq3UftQxjuhzJCAAnMF1WaFgInqcogG1RfY37Cy1x4rfUKV3GzZNlELMMH/fq+YLmh5fE=
X-Received: by 2002:a05:6870:1645:b0:287:34a7:af9a with SMTP id
 586e51a60fabf-2892c2d12ccmr1351368fac.12.1729229602782; Thu, 17 Oct 2024
 22:33:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Fri, 18 Oct 2024 13:32:56 +0800
Message-ID: <CAD-N9QUgp+W3Us2QFNF9Emde1Yb98_Mco3a-gbrfuMssVVbJLQ@mail.gmail.com>
Subject: Translation order of documents
To: Alex Shi <alexs@kernel.org>, YanTeng Si <si.yanteng@linux.dev>, 
	Jonathan Corbet <corbet@lwn.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	HUST OS Kernel Contribution <hust-os-kernel-patches@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi guys,

when I translate kbuild/llvm.rst, I find this document seems depends
on the reproducible-build.html. The depenency means, A will refer to
B, like the following contents.

``ccache`` =E5=8F=AF=E4=BB=A5=E4=B8=8E ``clang`` =E4=B8=80=E8=B5=B7=E4=BD=
=BF=E7=94=A8=EF=BC=8C=E4=BB=A5=E6=94=B9=E5=96=84=E5=90=8E=E7=BB=AD=E6=9E=84=
=E5=BB=BA=EF=BC=88=E5=B0=BD=E7=AE=A1=E5=9C=A8=E4=B8=8D=E5=90=8C=E6=9E=84=E5=
=BB=BA=E4=B9=8B=E9=97=B4
KBUILD_BUILD_TIMESTAMP_ =E5=BA=94=E8=AE=BE=E7=BD=AE=E4=B8=BA=E5=90=8C=E4=B8=
=80=E7=A1=AE=E5=AE=9A=E5=80=BC=EF=BC=8C=E4=BB=A5=E9=81=BF=E5=85=8D 100% =E7=
=9A=84=E7=BC=93=E5=AD=98=E6=9C=AA=E5=91=BD=E4=B8=AD=EF=BC=8C
=E8=AF=A6=E8=A7=81 Reproducible_builds_ =E8=8E=B7=E5=8F=96=E6=9B=B4=E5=A4=
=9A=E4=BF=A1=E6=81=AF=EF=BC=89::

KBUILD_BUILD_TIMESTAMP=3D'' make LLVM=3D1 CC=3D"ccache clang"

.. _KBUILD_BUILD_TIMESTAMP: kbuild.html#kbuild-build-timestamp
.. _Reproducible_builds: reproducible-builds.html#timestamps

I have several questions in mind:

1. Should we show this dependency graph for translators? This may help
improve translation. Otherwise, it may occur that A has been
translated, but it depends on B. And B needs translated so that the
translation of A can be merged.

2. Would there exist the loop? A depends on B and B depends on A
directly or indirectly.

If we only need to keep the documents in the mainline ready for
reading, it seems not a problem.

P.S., it seems current docs building cannot detect invalid URL in the
documentation tree.

--
My best regards to you.

     No System Is Safe!
     Dongliang Mu
