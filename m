Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6049B29408
	for <linux-doc@vger.kernel.org>; Sun, 26 Oct 2025 13:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761487100; cv=none; b=R1Vg1Mskn137MlOrxns8z3ov+2duMU6+2zfZai6Vzo0hAjkr9AHWoNXUUPe1Fj81ziT7NuF3pcz2sHTXEl5M9nn+IDiUpjMfnd7CklRojE5MJ7Dz3CI/rRjsmdf2KunAoLXFh7tRfFBuxNXuqmR93k/uTmH6v3JzlTT4lEwJyFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761487100; c=relaxed/simple;
	bh=8XeXdA5z39ftFVIIxiHKgVDeYFhsrsDZZW+COtgjH3A=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Q+vSHaLUOZB3UlVDwd3MDlJQ3asvGHUS4XN1BX54PfKZm232E6c3R0X4kYhJ1YGuV2snCk75QKWu7H6N0lQ1L1u2E/EE0gU6oY/nt29iWkIPiDkTd/ev8yKAQIMJp3RFAVaJ8Io9k4QiR+bJ5jdGwoGG23d0xzkYdIVfdE6/lrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FmusRpvt; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FmusRpvt"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-63c3c7d3d53so5657370a12.2
        for <linux-doc@vger.kernel.org>; Sun, 26 Oct 2025 06:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761487097; x=1762091897; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AGm4j24znqpP2x14ojj3CfonQDYyv+tUiBO9yGfd3gA=;
        b=FmusRpvtW43yzhwpTGof0pU/lndGlNPgHMW/QTLw9EbS8gp9yXZaBCiJ7YMNXV1OxS
         IDWsZLDiiPO1xHxicUc0MtpXChDMn1ggZrNjHTWr4RrMqJMf1Kf7hrp1J0qYvDi9EeBZ
         Oi2jLr30tMhPnjvKq27ONgHWgfIDCYpAciheuQp4VJYWQGa10rrpjiAOr8T7Qi1ZStpE
         6+TK4i4Rqrcdqs8ilIdIQfOodYqZTcFeava/Vpq0u4af7/aldqMFoOkdePuFZuVVr2B+
         9lGvv36nhd0m+4UHTpSc9co3lxlKRGuvq8oJwma7to4moEB8pMgQRp55LSDbGgdqn5Wy
         ToQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761487097; x=1762091897;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AGm4j24znqpP2x14ojj3CfonQDYyv+tUiBO9yGfd3gA=;
        b=RcSwpo77DwM+5P5VGqin3wTS9Eah4GY4Cw+dnr/Sl8LuxDBY6oyQNltUGAESygL80d
         anQwwzSpqCxrmk+ZfTNRf5muON/F7Sz0TK04PldNSgpCWXBSeGA1tWvKT0Arkvd5Hr5R
         eafwd/Kdq+8+h5ERpDV+UNbCypyzF28d+C4GrLKLFbTDHz/hL/b3ANnGigykQM5Z52OH
         A2+YtH5NpRKndx1rblTYkhCcKWQpPQKxbceGz9+GCSDKdBLt8bptIRiMIS8hvHzvFYoL
         shPLpimaoaXkDNujveAq3e40tUXS7xZubdLbp7UJku8hhTr+hKK4KlibjDcD5tyCd/kD
         OgSw==
X-Forwarded-Encrypted: i=1; AJvYcCV4VRHvGwshZsp7Sj566kHASyQV6pK7dtP7XlT4eFcrRAHaOaGUMUywuFS70aI/jP10wSjtvFIe8BY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlvdS3Vuyp3xPiAsUTpyre9oS6jS9X+wjYh9Ooq67+YTP/ZpJV
	Vlr18SULVV9THaZbwMyILi0fPw+QGktmF5eccbphzHh1VLrnqze2dLkiufN8IQcE+GfsNIToGEt
	+usV7CQNrWe+imNflRm9R/qbcgrDxU+k=
X-Gm-Gg: ASbGncsyBIFYefYLsx1UIeNVVUv0b1SrmsXm8qqiS98F6sVKGx10YKlECGnYg6ahwP4
	D6EfZmRHRqXIEdYawUsxTNz5J5SZRWHD4jKzDdJSfQv6B9awkXuFrpg0BbVpTwU6EdFX/fX/epo
	mDlN2RDpQXr8PRQ63SXMpBCS5/Cj51/6IwD7/oi9fxpXOhkS6TjevORGYNur+ABj5MUKJHkW/hR
	sEmWNwQg1ikT+8IJKXVy695Lro5JhyklWZaYZW6WBaHL7WM02PdorzA31RU
X-Google-Smtp-Source: AGHT+IElcZxknPTLqtmlk8JoQTkwCJx6B2ZN+N7jWkJmLgq10DmZ1g4gT2iUrFyxH8OUk9ayM2/tsygj87YvOWke3QY=
X-Received: by 2002:a05:6402:27d1:b0:639:f54d:9274 with SMTP id
 4fb4d7f45d1cf-63e60003a6dmr7168507a12.2.1761487096456; Sun, 26 Oct 2025
 06:58:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Alex Shi <seakeel@gmail.com>
Date: Sun, 26 Oct 2025 21:57:32 +0800
X-Gm-Features: AWmQ_bm8IjWucjxJWdtg5RJ6sDm53WgT5CWYNF0YvpgOLfKV8aQUl_NumdQX6Ec
Message-ID: <CAJy-Am=nupkp6V6L1oA5DPxFNKq=4qM=ZVxxLeAw+uSQGSVhrw@mail.gmail.com>
Subject: [GIT PULL] Chinese-docs changes for v6.18
To: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit f44a29784f685804d9970cfb0d3439c9e30981d7:

  Documentation: update maintainer-pgp-guide for latest best practices
(2025-09-09 13:43:55 -0600)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux.git
Chinese-docs-6.18

for you to fetch changes up to b5750c27d395f865030d2ab084c447e1df718dd6:

  Revert "Docs/zh_CN: Translate skbuff.rst to Simplified Chinese"
(2025-10-26 21:33:45 +0800)

----------------------------------------------------------------
Chinese translation docs for 6.18

This is the Chinese translation subtree for 6.18. It includes
the following changes:
        - docs/zh_CN: Add rust Chinese translations
        - docs/zh_CN: Add scsi Chinese translations
        - docs/zh_CN: Add gfs2 Chinese translations
        - Add some other Chinese translations and fixes

Above patches are tested by 'make htmldocs'

Signed-off-by: Alex Shi <alexs@kernel.org>

----------------------------------------------------------------
Alex Shi (1):
      Revert "Docs/zh_CN: Translate skbuff.rst to Simplified Chinese"

Ben Guo (2):
      docs/zh_CN: Update Rust index translation and add reference label
      docs/zh_CN: Add translation of rust/testing.rst

Shao Mingyin (5):
      Docs/zh_CN: Translate ubifs.rst to Simplified Chinese
      Docs/zh_CN: Translate ubifs-authentication.rst to Simplified Chinese
      Docs/zh_CN: Translate gfs2.rst to Simplified Chinese
      Docs/zh_CN: Translate gfs2-uevents.rst to Simplified Chinese
      Docs/zh_CN: Translate gfs2-glocks.rst to Simplified Chinese

Shuo Zhao (4):
      docs/zh_CN: Add security ipe Chinese translation
      docs/zh_CN: Add security lsm-development Chinese translation
      docs/zh_CN: Add security SCTP Chinese translation
      docs/zh_CN: Add secrets coco Chinese translation

Sun yuxi (2):
      Docs/zh_CN: Translate mptcp-sysctl.rst to Simplified Chinese
      Docs/zh_CN: Translate generic-hdlc.rst to Simplified Chinese

Wang Longjie (2):
      Docs/zh_CN: Translate dnotify.rst to Simplified Chinese
      Docs/zh_CN: Translate inotify.rst to Simplified Chinese

Wang Yaxin (2):
      Docs/zh_CN: Translate skbuff.rst to Simplified Chinese
      Docs/zh_CN: Translate timestamping.rst to Simplified Chinese

doubled (7):
      docs/zh_CN: Add scsi/index.rst translation
      docs/zh_CN: Add scsi.rst translation
      docs/zh_CN: Add scsi_mid_low_api.rst translation
      docs/zh_CN: Add scsi_eh.rst translation
      docs/zh_CN: Add scsi-parameters.rst translation
      docs/zh_CN: Add link_power_management_policy.rst translation
      docs/zh_CN: Add sd-parameters.rst translation

shaomingyin (3):
      Docs/zh_CN: add fixed format for the header of gfs2-glocks.rst
      Docs/zh_CN: align title underline for ubifs.rst
      Docs/zh_CN: fix the format of proofreader

 Documentation/translations/zh_CN/filesystems/dnotify.rst           |   67 ++
 Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst       |
211 ++++++
 Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst      |   97 +++
 Documentation/translations/zh_CN/filesystems/gfs2.rst              |   57 ++
 Documentation/translations/zh_CN/filesystems/index.rst             |   17 +-
 Documentation/translations/zh_CN/filesystems/inotify.rst           |   80 ++
 .../translations/zh_CN/filesystems/ubifs-authentication.rst        |
354 +++++++++
 Documentation/translations/zh_CN/filesystems/ubifs.rst             |  114 +++
 Documentation/translations/zh_CN/networking/generic-hdlc.rst       |  176 +++++
 Documentation/translations/zh_CN/networking/index.rst              |    7 +-
 Documentation/translations/zh_CN/networking/mptcp-sysctl.rst       |  139 ++++
 Documentation/translations/zh_CN/networking/timestamping.rst       |
674 +++++++++++++++++
 Documentation/translations/zh_CN/rust/general-information.rst      |    1 +
 Documentation/translations/zh_CN/rust/index.rst                    |   33 +-
 Documentation/translations/zh_CN/rust/testing.rst                  |
215 ++++++
 Documentation/translations/zh_CN/scsi/index.rst                    |   92 +++
 .../translations/zh_CN/scsi/link_power_management_policy.rst       |   32 +
 Documentation/translations/zh_CN/scsi/scsi-parameters.rst          |  118 +++
 Documentation/translations/zh_CN/scsi/scsi.rst                     |   48 ++
 Documentation/translations/zh_CN/scsi/scsi_eh.rst                  |
482 ++++++++++++
 Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst         |
1174 +++++++++++++++++++++++++++++
 Documentation/translations/zh_CN/scsi/sd-parameters.rst            |   38 +
 Documentation/translations/zh_CN/security/SCTP.rst                 |
317 ++++++++
 Documentation/translations/zh_CN/security/index.rst                |    4 +-
 Documentation/translations/zh_CN/security/ipe.rst                  |
398 ++++++++++
 Documentation/translations/zh_CN/security/lsm-development.rst      |   19 +
 Documentation/translations/zh_CN/security/secrets/coco.rst         |   96 +++
 Documentation/translations/zh_CN/security/secrets/index.rst        |    9 +-
 Documentation/translations/zh_CN/subsystem-apis.rst                |    2 +-
 29 files changed, 5056 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/filesystems/dnotify.rst
 create mode 100644 Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst
 create mode 100644
Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst
 create mode 100644 Documentation/translations/zh_CN/filesystems/gfs2.rst
 create mode 100644 Documentation/translations/zh_CN/filesystems/inotify.rst
 create mode 100644
Documentation/translations/zh_CN/filesystems/ubifs-authentication.rst
 create mode 100644 Documentation/translations/zh_CN/filesystems/ubifs.rst
 create mode 100644 Documentation/translations/zh_CN/networking/generic-hdlc.rst
 create mode 100644 Documentation/translations/zh_CN/networking/mptcp-sysctl.rst
 create mode 100644 Documentation/translations/zh_CN/networking/timestamping.rst
 create mode 100644 Documentation/translations/zh_CN/rust/testing.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/index.rst
 create mode 100644
Documentation/translations/zh_CN/scsi/link_power_management_policy.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/scsi-parameters.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/scsi.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/scsi_eh.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/sd-parameters.rst
 create mode 100644 Documentation/translations/zh_CN/security/SCTP.rst
 create mode 100644 Documentation/translations/zh_CN/security/ipe.rst
 create mode 100644
Documentation/translations/zh_CN/security/lsm-development.rst
 create mode 100644 Documentation/translations/zh_CN/security/secrets/coco.rst
