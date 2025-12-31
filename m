Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F182FF164
	for <linux-doc@vger.kernel.org>; Wed, 31 Dec 2025 18:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767205042; cv=none; b=nB9g9yuvFaE0Q6WTLfTEvZL7ReuqNJORYCJ2/cVJidwgpAkuKO+rowJrWiwGW3i+YdOzrwgGkBD8OhdgJfQ+OUrLbH3i642QpzxEBGjk2huBV8C31YKYUXdo5kec/lWJ32bAKUMBGxb3WLGs4uxvyMdDZge6WCkw2ITGVAsnUqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767205042; c=relaxed/simple;
	bh=DtW9jydX6kRSz+VzrOTs9HRP1q8pSatXePBnRhDvGcc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pCPw73xwbpBeSJaZPJ0h/Mz8m2SbCfUthZJqziV0InlLXWywLPCzxHfpoyF/i1BXyqp/Ar52cOWmwlE1OXDwTL/Vp3psFYAaF0kCA7uDwEH+pBHXgOmh49beE6diyTXSQN/KRTFxY+zFcwhkrvprMFrKMKu01ZeKOlu9jjB9MW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYs6QRd5; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYs6QRd5"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0eaf55d58so69013455ad.1
        for <linux-doc@vger.kernel.org>; Wed, 31 Dec 2025 10:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767205040; x=1767809840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SXoQb1Iho9s/aJU4/V83jmA8EbXo7twbK1X6eOXoFDE=;
        b=cYs6QRd54KTn7COi8TcmhfReUlgtg00ULE4Q4t3IoGT/xUALXfkF/OKgh7lzTOtdkQ
         qhYvgkXY6DD+znP7OO7SfBMBIyPj4T6LRbnMvC129+5NoPHUJpHzs93EVshJ7T6woIGg
         4n9XFkg6WBuyDK4IPXKpVquOUUmm/YFCUnSkZNvNSr8Oh0aeYnouA5iH09kMiR+sX7CB
         IjExd+zO3nwBgUR90wuEkSZOpvilM61HcP4+e3NsXBc9/IWLLTiL/hWakn/Nwn/bDbK1
         2CWu1Yn8MsPud0bBQds7u0B81ICEf2OhnluR5vXovSV4rRxgjOVlvujiDPRMCKTgYYvx
         09cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767205040; x=1767809840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXoQb1Iho9s/aJU4/V83jmA8EbXo7twbK1X6eOXoFDE=;
        b=BWCsv99k8+AQwK8cNjRzlg+ptgumahSN+xNBvTB/ZVRzbxgpDb8WmJrpHQ3kj3A8bq
         cj4Lz/lTeXZ6XT/Fd5TSwQyz4hwopaGQ2RpU/Wr2/wQAknqhii3vGDNFH/uwpiouJtJS
         coy5Kqr3ya6HKDAGi08eNPu8RQXt6ShnhBaFKYbZIPNFBHYpPJX1eZLMfpOiTf51b74c
         RUjSu7FzLJE3taCvv3iD/j5kB9s40gGzpS70cgiqwcl+Adsq5a6kwZbYetlY/EVOCN18
         81tObbdlF8+Kz9e0F07lW22XtmmUpf1ZCtnMfOXr1/FJDAd/VlCugb8293FWEX9F+qgU
         Rl+g==
X-Forwarded-Encrypted: i=1; AJvYcCVUpB7dc6cJtRFshPspYtxnMIWgMiXpXQKXw7FwL94Ar7o9CVtsRNsENDT/985biCIO+FuKQtej7JI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl/srJJSQVN3if7+53hh+q3UuiYC2H8OHJD83n7OhfdgviA42k
	KAF6ani1ck+QQzgqQaWXuq9HSVgL909/n7UJAXnlHyjh4pQWGFY22cv5
X-Gm-Gg: AY/fxX7Ktly6VUL1ghl13ZNIKJuhkPYK28GZkY+BensfEVPT6rtuvTlZtcjgAapyPBk
	QvSFM1CEkgOLWplVb+ga41t/Sv5uCZg31SscBlTN8mXFhn8XEXTJ5pP733kaHihsjq6KGWYoDu0
	BRi39KUL7M368U/4fvON6iYzMkCxtJyqHcjN5QYUj8dFKgBNX0DrbtmuyEV21IFbuMFhjiW+Zm1
	Jn1wkoTMNR3OkAnbm1801h/XKCOj9iw89fdf3eFQXgkVgaTh+mHeEAqCMiMMky6P9cZVrnMPwty
	ra/WSS9Ocq2CatIPFIhBGNOtHBNwv+K2wQt30xFrxGIxcUzjOB9QKl5Gc1toKa7JncOW78yNg09
	G6GAbYU/UkfGYlsOyaMxXs7kZ2xc0YQ+nWPsvJ2t3FoTaFKuNiVz6kwzzP0SmxKqMGkaqr6pkuq
	/1xijjLo1BcUrBEY3k
X-Google-Smtp-Source: AGHT+IFt+YYUuQnJIjJqsNxOfFi0ONI4ZVIqnGrLeLLNJzP5CtQl3rVTd4nmjmgrcpUv1MsNBMmBaA==
X-Received: by 2002:a17:903:41c7:b0:294:8c99:f318 with SMTP id d9443c01a7336-2a2f0caa8eemr448221945ad.3.1767205039865;
        Wed, 31 Dec 2025 10:17:19 -0800 (PST)
Received: from rakuram-MSI ([2401:4900:93ef:93d6:a0f7:dedb:d261:86b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66473sm310787225ad.13.2025.12.31.10.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 10:17:19 -0800 (PST)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: rakuram.e96@gmail.com,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Oliver Hartkopp <socketcan@hartkopp.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/2] can: add dummy_can termination and update SocketCAN docs
Date: Wed, 31 Dec 2025 23:43:14 +0530
Message-ID: <20251231-can_doc_update_v1-v1-0-97aac5c20a35@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251228-can_doc_update_v1-33b15a48aff7
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767203695; l=1574; i=rakuram.e96@gmail.com; s=20251022; h=from:subject:message-id; bh=c2Ukyvmu3x+ZNm/g42TZwi6hwotnurZ3OlsKNTQ8zxQ=; b=4+zCI5bRXSp0OszcugSJ5zY1CIOEsIwO5aVMoNPNxZeR7cbFHZ23mqJw9rOT5QeZSyqBic/dV WUaTO54DYpPAnwr4U3ONOj7FQWwsNBr0fDhkzuBKah6Dfx9O5frez/I
X-Developer-Key: i=rakuram.e96@gmail.com; a=ed25519; pk=swrXGNLB3jH+d6pqdVOCwq0slsYH5rn9IkMak1fIfgA=
Content-Transfer-Encoding: 8bit

This patch series introduces two changes related to CAN XL support:

  1. Add termination configuration support to the dummy_can driver,
     enabling termination testing with iproute2.

  2. Update the SocketCAN documentation to describe CAN XL operation,
     including MTU changes, bittiming/XBTR settings, mixed-mode
     behaviour, error signalling, and example iproute2 usage.

The goal of this patch series is to improve dummy_can support for termination and
update documentation to match the recent addition of CAN XL upstream support.
Feedback from the maintainers is highly appreciated.

Base commit: 
commit d26143bb38e2 ("Merge tag 'spi-fix-v6.19-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi")

Testing was performed using the iproute2 master tree, which contains the
required CAN XL netlink support for validating these changes.

---
Changes since RFC:
1. Maintain dummy_can structures assignment as is
2. Update the examples with latest iproute2 tool (v6.18.0) 

---
Rakuram Eswaran (2):
      can: dummy_can: add CAN termination support
      docs: can: update SocketCAN documentation for CAN XL

 Documentation/networking/can.rst | 615 +++++++++++++++++++++++++++++++++------
 drivers/net/can/dummy_can.c      |  25 +-
 2 files changed, 541 insertions(+), 99 deletions(-)
---
base-commit: d26143bb38e2546fe6f8c9860c13a88146ce5dd6
change-id: 20251228-can_doc_update_v1-33b15a48aff7

Best regards,
-- 
Rakuram Eswaran <rakuram.e96@gmail.com>

