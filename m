Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45611E531
	for <linux-doc@vger.kernel.org>; Tue, 15 Jul 2025 15:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752592043; cv=none; b=EvSeGeC+fx4Zt71vg3n7u4bg4mEvmQlDHnO1jHllZjyt4CDB7NQC08m/RnHPi64Jja2KAhm1Isuj5Fc/FCOgBMIhO/fvWk65twlIB0YPg4JR7cI7NedgtDK9JsibhjIx7q3cqGJp1gWENg0gDiD0Kg+P753GvTiR1+IVi12FQNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752592043; c=relaxed/simple;
	bh=OY7wQZql2LRKOog5H5i9PFotpyySOScHXlqWzO5rXnE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Z3nbxoNyrF1Dr/rm2o+V533B6hHgRZ0CxUJIivZGm7Z0xDJekusmt7j063d/LpEV++GA9QpYUxhC6tWlCXBUVRQofoPOYZxXrcvsCIQvfY1KJZlOYdMLsG2g9W0Y8CjQW+pThtbwzdI5CCZP/u7lQPIrwLI9a0kYgGQld/rYbFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ap009cl2; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ap009cl2"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so10110868a12.2
        for <linux-doc@vger.kernel.org>; Tue, 15 Jul 2025 08:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752592040; x=1753196840; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W8KD/Kh9dDq6VFLdO/7xq0Vndb/HuzEyKpy3hNh9oVc=;
        b=Ap009cl2gLVwA4svCVbjGtGJ3BJkJKsDtDmj4kb5WZyNJPwPW8fG/4fvsYgzkRs+HP
         6K5i0UxvdEpbcfwnMp4S/MfJyerpeEGKY0fyg8ObZKZc7kt+GoyG+MhU2CkeTKnLzZdO
         jl5INzBF0MESN9F9NibO+apZ8AdlBZJ8Tk1Vrs1y6JOUdURO5d1jPgoDPrQehHlvHa5X
         cqEgp+qXYKgGdwk+GV3VFgPuYK3FhECN5oBzsDm/k67mFgmxvZQuakGjJlDZ8X8kkFHV
         DWE7ooVx5Vpgo9fKmX4iWj/nvYsfwordPltu+RZWi1660nEGW+X9vo3yg4FQvbpRxdwm
         zACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752592040; x=1753196840;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W8KD/Kh9dDq6VFLdO/7xq0Vndb/HuzEyKpy3hNh9oVc=;
        b=IAmBODmaMGdciUgUTaSqN5yaFrzW4AFXn2nrP+Jg2xu3tEmP05YSs3kkrrgJFyuPdb
         Q5X6tTeHKeb1jQPW8J/FhYcr9csXUb+JBFOkW+aOGsl3ZNzjwQ8YbRWFuomWTj5gfTQM
         dObWIhqO11pZHo7BTncCkn6oXP8hhIMoykv6JsL9yID1mNDgu9djvDJIYKSblmIp+qy8
         6ePnT67WV1IhgBOCBAUerF6IqtXOLxe6fItg8qHdILlk+TFKskmUL1gtRughg7zecH4r
         w+v/hbsT8eoR11qTZzEovCbl+Nl76pih0pC7QERiuNC2oiuNcexYEP/6Rx/NqxYNdWo3
         f/xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQrRS+0pOb+pJY9L0PwWLXBYQPbmQ/ubGLRKBfQqlVFvAydkqYfE1Kjw88Vllfz4y35rCAo3i1lMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoY33onm7NKBR1RiQjGkKIBPQKZyLFRMVWxYo8oPdEUbgTCDIU
	Z/cixT2qdYxFTWeowk8ri84RFkzaHhtn2Yez6VECenzPpvT62dsX5A7tFbakpG+EZN2+b1z6kXz
	f7j/QB0TeaaMxmv3Uhj4/JXsgnTAtatqC4qzHiMeFvg==
X-Gm-Gg: ASbGnctt98ss5222ESPj8PaBFcIJgiAwD3yd0BJe/2kuvXIL9c7zg4ZYBKTgHN7Njuc
	yLxPusoPrDMxAVxDhIBcXK8VZHZUlV5x+F1RDRB/7jUVUFB8hQ57vcTcg9DsU0TXaHm78QsVtm3
	N8dQEJVxp8GWtpsuDRQtEz87d+qjTHpNEbvHFGInlE6VPfa1vQ2+xZblqa2rYIPyS49nO0fUL1S
	nxJjJQ=
X-Google-Smtp-Source: AGHT+IHxeaU6CBpgJe9AVdkML+GKEdH07M0wGCVwTLapztsGKhc2A0/a+D/BOM2jT5l73HeaajbLbb2CkTXKF0ksOGs=
X-Received: by 2002:a05:6402:3204:b0:604:e602:779a with SMTP id
 4fb4d7f45d1cf-611e8505c33mr13390054a12.28.1752592039698; Tue, 15 Jul 2025
 08:07:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Alex Shi <seakeel@gmail.com>
Date: Tue, 15 Jul 2025 23:06:43 +0800
X-Gm-Features: Ac12FXxtcZEI__o_V5mhB_Vc6eGZzq6WgpRFEs12-V0DrQIbwxqt1OY5AyQVIPw
Message-ID: <CAJy-AmkHszv8wV2qjVuALNfF4dpmwfk4APavqXUso+ebkJtHNA@mail.gmail.com>
Subject: [GIT PULL] Chinese-docs changes for v6.15-rc1
To: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>
Content-Type: text/plain; charset="UTF-8"

Hi Jon,
Please merge the Chinese translation docs for v6.16-rc1.

Thanks
----
The following changes since commit d3f825032091fc14c7d5e34bcd54317ae4246903:

  docs/sched: Make the sched-stats documentation consistent
(2025-06-09 16:23:58 -0600)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux.git
tags/chinese-doc-6.16-rc1

for you to fetch changes up to 744cc616b8d80ae57b6fdb3d23dd2fa27bd25d2f:

  Docs/zh_CN: Translate alias.rst to Simplified Chinese (2025-07-06
21:13:46 +0800)

----------------------------------------------------------------
Chinese translation docs for 6.16-rc1

This is the Chinese translation subtree for 6.16-rc1. It
includes few changes:
        - Updates to the process documentation
        - Added translations for network and speculation docs
        - Polished zh_CN/how-to.rst
The above patches have been tested by 'make htmldocs'

Signed-off-by: Alex Shi <alexs@kernel.org>

----------------------------------------------------------------
Cui Wei (1):
      Docs/zh_CN: Translate speculation.rst to Simplified Chinese

Dongliang Mu (7):
      docs/zh_CN: update the translation of process/1.Intro.rst
      docs/zh_CN: update the translation of process/6.Followthrough.rst
      docs/zh_CN: update the translation of process/7.AdvancedTopics.rst
      docs/zh_CN: update the translation of process/2.Process.rst
      docs/zh_CN: update the translation of process/5.Posting.rst
      docs/zh_CN: improve formatting and content clarity
      docs/zh_CN: update git command examples in how-to.rst

Qiu Yutan (2):
      Docs/zh_CN: Translate vxlan.rst to Simplified Chinese
      Docs/zh_CN: Translate alias.rst to Simplified Chinese

Wang Yaxin (4):
      Docs/zh_CN: Translate napi.rst to Simplified Chinese
      Docs/zh_CN: Translate netif-msg.rst to Simplified Chinese
      Docs/zh_CN: Translate xfrm_proc.rst to Simplified Chinese
      Docs/zh_CN: Translate netmem.rst to Simplified Chinese

 Documentation/translations/zh_CN/how-to.rst                   | 108 ++++++-----
 Documentation/translations/zh_CN/networking/alias.rst         |  56 ++++++
 Documentation/translations/zh_CN/networking/index.rst         |  12 +-
 Documentation/translations/zh_CN/networking/napi.rst          | 362
+++++++++++++++++++++++++++++++++++
 Documentation/translations/zh_CN/networking/netif-msg.rst     |  92 +++++++++
 Documentation/translations/zh_CN/networking/netmem.rst        |  92 +++++++++
 Documentation/translations/zh_CN/networking/vxlan.rst         |  85 ++++++++
 Documentation/translations/zh_CN/networking/xfrm_proc.rst     | 126
++++++++++++
 Documentation/translations/zh_CN/process/1.Intro.rst          |  10 +-
 Documentation/translations/zh_CN/process/2.Process.rst        |   7 +-
 Documentation/translations/zh_CN/process/5.Posting.rst        |  11 ++
 Documentation/translations/zh_CN/process/6.Followthrough.rst  |   5 +
 Documentation/translations/zh_CN/process/7.AdvancedTopics.rst |  14 ++
 Documentation/translations/zh_CN/staging/index.rst            |   2 +-
 Documentation/translations/zh_CN/staging/speculation.rst      |  85 ++++++++
 15 files changed, 1004 insertions(+), 63 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/networking/alias.rst
 create mode 100644 Documentation/translations/zh_CN/networking/napi.rst
 create mode 100644 Documentation/translations/zh_CN/networking/netif-msg.rst
 create mode 100644 Documentation/translations/zh_CN/networking/netmem.rst
 create mode 100644 Documentation/translations/zh_CN/networking/vxlan.rst
 create mode 100644 Documentation/translations/zh_CN/networking/xfrm_proc.rst
 create mode 100644 Documentation/translations/zh_CN/staging/speculation.rst
