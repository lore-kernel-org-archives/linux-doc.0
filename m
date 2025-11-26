Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354D836D4FF
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 07:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764140574; cv=none; b=qc1nfY5jSyOspI/Zr5pfnu1LvK68uYwpLvmfjdKxUbtLQfpbVS+Lv8l7FbEPPxUbP/ccYbvjOM9lDGW853MlBEHZf4uJyfrZ3kUuynwX8KFNBQ1TsnCvEg2Lyt3WxgVfzM5JnuBs7M0s8zR3y2aUYy5d8Qkr157HZCbfp+R0xbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764140574; c=relaxed/simple;
	bh=mSqkdmuMdYzGSwXJ1BlQbiuvC1O9p5JqL59APV2mX9s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Ns7RQazllc492plQ+4pZdPgQmaIGl8wP+TdstDh4i2YbzjFrVeBCZO2c2ZLLkHCVLBB3eXJ8kBWndDM275/1sy849STgVoL2crHMjJ8nEdTm8liHiN4xM81ookT685QR/puqqyF0APlwnwFazHJcWeyJwMYcLEyRWcqOfe1BoFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOy9jqSv; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOy9jqSv"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b735b7326e5so97622266b.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 23:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764140571; x=1764745371; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pmSddDJMFoPJKosyYrci1CbZkbhsVJtMJ2d4BSd+2WM=;
        b=kOy9jqSv3d9IP8hiMKJgVbLq8bYx/zJGN5RpRYrJ56hFCmJ+wO9h/LqHLXox6XeJWg
         blSroReJYysB+2WAn+7PejUimhjtx7pvhFQzXw2dWMCISkz4sXEls2unxlKYX3xBZtdt
         B4IofEgjxLG3RfpOc3Q8IWG04R4AxIgyTot1VUBSgh3EBznAzsRw6xwQiPoF7/9ByLsg
         CfBtd2ZV/qYHi3ahxzq82V1sumNh8nHUzhW1LwmWUPR4d2obe9Axe6Rejr9GxGhZ676A
         0VRIR/uPl2uaVfPPrF2ZlqRuUPIb+yBrUR9MDBMvanveolRgvu1kY6hIXhREG4x7HRc3
         qYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764140571; x=1764745371;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmSddDJMFoPJKosyYrci1CbZkbhsVJtMJ2d4BSd+2WM=;
        b=kW81Yvm3MqjoaGOj3j+66SDXX/Yp/aBW2dgyJ4o8yOKlsUfaJOP/LZjX27qkhmzW7b
         mZzbUPN6hl7yrnjmZL98hFpjrvRnqxOvwtx0/rJAj0fGjEY6b25sPSbIhQw5hG6UH9UI
         uAmXWKnb5gYqwnFKJXkGnODJEwQeo7S6q5/WKfn7U1LUrBeXnVayjQGONk6QGrh1gExZ
         wyxCArWpFdkfDEDaO/zRceVFm+bsKekUZLFEVIv05MCcN3lZV75k8CaZ/WSfAW++9P5u
         XAWVwOMIOgSC8wp15ik7OLryxQMM4Eq+HP/6nc7k1CJd7ERMdvLk1Qih/JagmBm4o3Uy
         B86Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmhOU/z+XeSLahul7tINOFRkH4vrlSy+aQKKeIoX7w5pzufuyoHJXd3RrnR8idTOAJwgt/hw5JyYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPzv+8vfQOzIOwsJt4h60+xu3NrRSK9bFs7ArKOYyeRPKPgzes
	chYm9cT9dlkWSvZKtTyCkb2EQ9zALaFw6eIsO/4TX1iRRjRzDFBo7PLVtQfbO8e5z+nGRR7kQtC
	sbQblFYqmlHrCEP3vi5q78YLGFtrew/s=
X-Gm-Gg: ASbGncvVk38B9V/X0Rnc3xzPeBSFSmqXY0Ns9hOREZhHceQrwt+NYlLfko+DYBDfSJf
	AbmMmQqm4ipEpeV7fWIerz9v2ENO+I/fsJqKf1p8PF/ldDrZMcH91Ief7VZE5CQ4eRBA2UG7+Pq
	LgVA1nthHWnETqCiT625fX9Ml5qqdghr2ywzGJz+doKRCciQ9OQAnuMa5wNRRywsWZlNaKbSoZX
	n2pLrcMbpktyyVpzByLtZb4fcQCQLQHZ26NCRWk0vK1Wns9ZpuiloVPchcpE25DXn+LZWQ=
X-Google-Smtp-Source: AGHT+IHLipZ7Kv2siOq76cnZlBvar28wOmbtrLmwSOoFNVVy5aff3ttK5OB936DX2nULm4fxHXby3+rQNPOjHjVCiwk=
X-Received: by 2002:a17:907:3ea1:b0:b6d:f416:2f3 with SMTP id
 a640c23a62f3a-b7657285452mr2441491266b.19.1764140571086; Tue, 25 Nov 2025
 23:02:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Alex Shi <seakeel@gmail.com>
Date: Wed, 26 Nov 2025 15:02:13 +0800
X-Gm-Features: AWmQ_bm0MrbFzH01MXOtwEgQLAjPWtw2ib20x2H4ubkrSST-6ph0yD-ifgIOtgE
Message-ID: <CAJy-Am=UvsKWHFQBdXb1ZM+HYgaCH-6G9M=cqaQ5NNLZ7zTpgw@mail.gmail.com>
Subject: [GIT PULL] Chinese-docs changs for v6.19
To: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 68f3d40ea0ce9fe3a26b9fd1d8ea734386bfb9ec:

  docs: parse-headers.rst: remove uneeded parenthesis (2025-11-13
09:34:40 -0700)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux.git
tags/Chinese-docs-6.19

for you to fetch changes up to f12ae9ba4d234732dc091cb0565d52b286de7572:

  docs/zh_CN: Add wd719x.rst translation (2025-11-26 14:40:12 +0800)

----------------------------------------------------------------
Chinese translation docs for 6.19

This is the Chinese translation subtree for 6.19. It includes
the following changes:
        - Add block part translations
        - Update kbuild.rst translations
        - Add more scsi translations and fixes

Above patches are tested by 'make htmldocs'

Signed-off-by: Alex Shi <alexs@kernel.org>

----------------------------------------------------------------
Chenguang Zhao (1):
      docs/zh_CN: Update the Chinese translation of kbuild.rst

Yujie Zhang (2):
      docs/zh_CN: Add libsas.rst translation
      docs/zh_CN: Add wd719x.rst translation

ke zijie (4):
      docs: zh_CN: scsi: fix broken references in scsi-parameters.rst
      docs/zh_CN: Add block/index.rst translation
      docs/zh_CN: Add blk-mq.rst translation
      docs/zh_CN: Add data-integrity.rst translation

 Documentation/translations/zh_CN/block/blk-mq.rst         | 130
++++++++++++++++++
 Documentation/translations/zh_CN/block/data-integrity.rst | 192
++++++++++++++++++++++++++
 Documentation/translations/zh_CN/block/index.rst          |  35 +++++
 Documentation/translations/zh_CN/kbuild/kbuild.rst        |  27 +++-
 Documentation/translations/zh_CN/scsi/index.rst           |   4 +-
 Documentation/translations/zh_CN/scsi/libsas.rst          | 425
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 Documentation/translations/zh_CN/scsi/scsi-parameters.rst |  16 +--
 Documentation/translations/zh_CN/scsi/wd719x.rst          |  35 +++++
 Documentation/translations/zh_CN/subsystem-apis.rst       |   1 -
 9 files changed, 851 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/block/blk-mq.rst
 create mode 100644 Documentation/translations/zh_CN/block/data-integrity.rst
 create mode 100644 Documentation/translations/zh_CN/block/index.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/libsas.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/wd719x.rst
