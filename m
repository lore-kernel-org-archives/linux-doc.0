Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC0EDDDC
	for <linux-doc@vger.kernel.org>; Sat, 15 Jun 2024 02:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718417050; cv=none; b=jo/1CUxqYNjPhK/TAGwLvBJuhKOcod18O/9/1Rop5ZzEYXTmik0o/wg0xWMltwSaKuPh6rvvqp6+0vHUr6lFXKYcd6xLakTV6dHLU1BV8RdlbTr2eFMTgPVQMT+xYJy5Jv09ftDFg62d6sj/UHMPpGkk2bxE5/onmPUJ6bsBwaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718417050; c=relaxed/simple;
	bh=ZJXPz5gCNl9GBaTas9ASxCkMJYYMS3RsF4GomEl8KIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=clj8SbL4hQzDIr91hvgroxy1lT2QXROOjVpRx4L7W11EFu4mFEfBQYIYqnVt2W+V6DSGr0UoGPxFrfrOJHGDYd9Aej4VW44cETDZ7H7IUc9FRXw7KZkns2zytTmz1JvMpsYrXcGEmCQ2gCdUDHvF1oQ7vd6KJVtKnNVqIL7LHhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NNQ4OetP; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NNQ4OetP"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ebe785b234so26396151fa.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Jun 2024 19:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718417046; x=1719021846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfSbDHLdI7lOPenyweve9pVzyLtMzcxM7OcWqFRyfTI=;
        b=NNQ4OetP+nwwHux/QR0AFDlW0dkAy9LJi4woDXkvhJEFoWFyzKrtzMsCjopMKpvVjP
         Ep++NnFC9XBdan3K3fZEnfJn0h5cOCT1kXZBrCFMQfSuI+LiVjFfioPchqUzVCq/2eEr
         shyHaswvwYRyo0He38XBnSB9ErH3wxMgwefyquEPMZ0JvDkxvV84fch/Bo48UnbbAp0B
         J/FpxYTg7gsgavPRRO7X2XidE52sbgGnJG+Czc7ngmSoLd9M6CvOepJOT9kO+y3cm0qC
         jrY0E8iMaWk3bdI/V3X8azdhE3T9M3lThM1Lot0HTGe8/Muu0X5nr8PkwenvYtVN7X2g
         eK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718417046; x=1719021846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfSbDHLdI7lOPenyweve9pVzyLtMzcxM7OcWqFRyfTI=;
        b=gmX5+6g6uGo2vLn0ZmVwOTw/QApAUKXfNW1aYEkMRnen6+VX5CkEdbKvAgObxc849M
         /nCrFD6oihfaD3HLmUHo1LEZ2rQRxqR3Uau5zXdQ82qzvH4UHl1gwRLeJ51xDOZEoRut
         Xox+xhFb1/6GDPggaEOffEUDoY5vS2rcRH9Z2PFhge8+kcyzAgFfdBYBlzRaJ16oqbVa
         qtaUYDu8l5NqCX3s9mgJfvb3eURT3obZOESm1hoeASu1689yhVrGcecA42aPw1OEWtrm
         Il+ajaDTNuWU8FrDaMwnKylhzuIi+sY2Gn2y660I0mwPlcX0To/XTL6L3D9R6Pc7wfIK
         kZYQ==
X-Gm-Message-State: AOJu0Yydy7cQ/DU1VwyJl7CqPX0m5DVesdX3QFJIKXFIbaCMjhuBVYe7
	0tKvJNROOTN6dXiooJYIH9uQ9UfEBjRwQWqjkHIS7W9YDpGW2lArPNKbMQyxGw0zD2rod0NjjYf
	Pwt0=
X-Google-Smtp-Source: AGHT+IFVZyTcIvbtfJNPKvIZp7JacqXXipNTuJKgpKnVmt5m4hY8RAbm4Kv1RRfvuizzzR8z8W4hkg==
X-Received: by 2002:a2e:818e:0:b0:2eb:dc60:6ca9 with SMTP id 38308e7fff4ca-2ec0e46deddmr28169721fa.21.1718417045953;
        Fri, 14 Jun 2024 19:04:05 -0700 (PDT)
Received: from localhost (2001-b011-fa04-32f9-b2dc-efff-fee8-7e7a.dynamic-ip6.hinet.net. [2001:b011:fa04:32f9:b2dc:efff:fee8:7e7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb6b9c9sm3722443b3a.160.2024.06.14.19.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 19:04:05 -0700 (PDT)
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	stable@vger.kernel.org,
	workflows@vger.kernel.org,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>
Subject: [PATCH v2 2/2] docs: stable-kernel-rules: remind reader about DCO
Date: Sat, 15 Jun 2024 10:03:51 +0800
Message-ID: <20240615020356.5595-2-shung-hsi.yu@suse.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240615020356.5595-1-shung-hsi.yu@suse.com>
References: <20240615020356.5595-1-shung-hsi.yu@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When sending patch authored by someone else to stable, it is quite easy for the
sender to forget adding the Developer's Certification of Origin (DCO, i.e.
Signed-off-by). An example of such can be seen in the link below. Mention DCO
explicitly so senders are less likely to forget to do so and cause another
round-trip.

Add a label in submitting-patches.rst so we can directly link to the DCO
section.

Link: https://lore.kernel.org/stable/2024051500-underage-unfixed-5d28@gregkh/
Signed-off-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
---
Change from v1:
- explicitly refer to the link as an example in the 1st paragraph (Paul)
- commit message typo fix s/explicilty/explicitly/ (Paul)
---
 Documentation/process/stable-kernel-rules.rst | 4 ++++
 Documentation/process/submitting-patches.rst  | 1 +
 2 files changed, 5 insertions(+)

diff --git a/Documentation/process/stable-kernel-rules.rst b/Documentation/process/stable-kernel-rules.rst
index d22aa2280f6e..85a91fd40da9 100644
--- a/Documentation/process/stable-kernel-rules.rst
+++ b/Documentation/process/stable-kernel-rules.rst
@@ -168,6 +168,10 @@ If the submitted patch deviates from the original upstream patch (for example
 because it had to be adjusted for the older API), this must be very clearly
 documented and justified in the patch description.
 
+Be sure to also include a :ref:`Developer's Certificate of Origin
+<sign_your_work>` (i.e. ``Signed-off-by``) when sending patches that you did
+not author yourself.
+
 
 Following the submission
 ------------------------
diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 66029999b587..98f1c8d8b429 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -394,6 +394,7 @@ e-mail discussions.
 
 ``git send-email`` will do this for you automatically.
 
+.. _sign_your_work:
 
 Sign your work - the Developer's Certificate of Origin
 ------------------------------------------------------
-- 
2.45.2

