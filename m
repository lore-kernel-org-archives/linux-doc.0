Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386472D0620
	for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 20:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755032190; cv=none; b=WCMdp24IfaUepcB/bNWX2ZjVXGcx92LCI+NN7a1IHFgHaH0K+MV8/hhKxMXIgAK2eZZBRvZMg5Ypt6dKaA4F0E8pxR0bRnnlTRHPKyUhT7KStZiAhUZoAt5IvYTIJRieXYohy4JzFolQ54NI5TDa7W0CgcBMq8IMySVAyZuHqk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755032190; c=relaxed/simple;
	bh=b50XDWuSoO4DukBYvfUq+UKIaGiKlcxo42yLKr/QuqA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=liTh+GD7Xv3MAWX6g3IziaKb17uM5kS1uXsGACpKRmgsRtaki0E7uEfISrDNX/1oA1LKDLmcxHwsYgZqKsL8DZevLGCBwLMikkEH/uiL4w2S2j0+d8ti+T3DPAniUU2rib/1ob8wvDPWeKcn4W7G5UM9wxMMUYXYovwTf5QFt98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKKg2WXz; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKKg2WXz"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76c18568e5eso6665331b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 13:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755032188; x=1755636988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQLcr/Hc/1la2qzpBNmuXzcig5cEllMajLPohQU0lJ0=;
        b=EKKg2WXz1ngM84XNbCjMXl4P32/OpetcR+FTHFRB1uz3g63qvVHdYoQnvNAS1TTIQJ
         ArDuMGjuPrOw+t/FY6OQubSi4hNWPW7rnjO3nVUpQ6L1WAWgmb9S5BXfSyRgEmc2J2Po
         zrABM+rQR1P8QP8NfgMLOBtIC+z2XdTOZsZNcD98ER9jWNzGUaDOw1g5RsyxLDhWkRyg
         q5c56f54ejwCdp5U8WxlFLyqK5FxtpgozkE4lHpavBLO2Gh6u3MeTYK9yKFirjmysK+e
         rv4YvfaSALx6I8O12r7xxjbv3LEUkmGvgKC3UpkmuNlMPT841O37T3xITsiQ4pzf2j0b
         kuuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755032188; x=1755636988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQLcr/Hc/1la2qzpBNmuXzcig5cEllMajLPohQU0lJ0=;
        b=rwEje6m2rZanOwCuA2kquoemrm/OfU/tugX3egt9xQ2vyhje5Tvu3+AOvrFx6g7TBG
         dJieX/uBzofYixwQ2qRNsnAfNEEvwxp30FXJy0sR2Ra51RhBgg6CVloFxOcnrZx/j6sg
         Puux5KJvqvK7u98E4alyP75kch0a3UOpt/HIyJFNEZb4vvsncvTO7HMG0oE7h1knQZXz
         DPLjLJ15OdjfUDCN1jqJbALv1FGk/uj8kSfsbzj+clZH9JBejeDY6aNczJNN1eG5mObX
         0VGeOW4NE+D70uNf0ZN2w1Bd2OHRvsOQZBwDk+GVY3a0v01QUq27Ypl3umsGsBvDDHM3
         9q1A==
X-Gm-Message-State: AOJu0YzviQZrC9erIZk8o7mNAAnfKCEnoI+zswBUw+QWf8aQtTcwX+Fw
	Jdtsh5JwlUHps/lw8eDgleLMVeLD13XKjqge78W8A0sO0GpujfZ7GzqMJCJTArV1n6U=
X-Gm-Gg: ASbGnctwrk37iuagRNEmz0A68OWPKOBfX7DKximdi18KPtHKo5tqUI7k20ex+cPl4jF
	hR32oQaETl17vuvkFTYnyl+s/f+iIoNylMEC3OBv56YR2PovDX1L9EpbSl29vNRNtijyfyEkIPp
	NrVRMkr4q7mNQdedtJQv4TnIik4gNhVxGWMSsj/QWNBpPvemG2+88qDAapcrLo73B4gO3yhQf2v
	2WxRLxhq9CxW0+RLUmCsxdPEgsoS1+bs3n2VqiC/9MZ9k3aGdIqO5Hefdj4J2BFjY7GELyYsDNg
	ABAvOhZW63CkI4wXcot9feyQ1sNWsF+NwZ/+5/o33EmUwsi59xTkTtawcw+3f0Uq/UWxbjLDbUM
	EJ2hLC8AC+kBjuojs81f5uwwxNGNOLOs=
X-Google-Smtp-Source: AGHT+IHj3Rc8NkX4woDnqtbsC29mLapjLaI43gJrsz3K6HVsCx7MUVlry0TFBrHh8QOjrERbBRqLwA==
X-Received: by 2002:a17:90b:1c0e:b0:312:1ae9:152b with SMTP id 98e67ed59e1d1-321d0ea6458mr520513a91.23.1755032187823;
        Tue, 12 Aug 2025 13:56:27 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321d1db5cccsm76048a91.18.2025.08.12.13.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:56:27 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Soham Metha <sohammetha01@gmail.com>,
	SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 6/9] docs: damon: fixed spelling mistakes in documentation
Date: Wed, 13 Aug 2025 02:19:49 +0530
Message-Id: <20250812204952.73136-4-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812204952.73136-1-sohammetha01@gmail.com>
References: <20250812201523.69221-1-sohammetha01@gmail.com>
 <20250812204952.73136-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed the following typos

- directores -> directories

in `Documentation/admin-guide/mm/damon/usage.rst`, and

- multipled -> multiplied

in `Documentation/mm/damon/design.rst`.

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 Documentation/admin-guide/mm/damon/usage.rst | 2 +-
 Documentation/mm/damon/design.rst            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/usage.rst b/Documentation/admin-guide/mm/damon/usage.rst
index ff3a2dda1f02..5cd42d428c89 100644
--- a/Documentation/admin-guide/mm/damon/usage.rst
+++ b/Documentation/admin-guide/mm/damon/usage.rst
@@ -357,7 +357,7 @@ The directory for the :ref:`quotas <damon_design_damos_quotas>` of the given
 DAMON-based operation scheme.
 
 Under ``quotas`` directory, four files (``ms``, ``bytes``,
-``reset_interval_ms``, ``effective_bytes``) and two directores (``weights`` and
+``reset_interval_ms``, ``effective_bytes``) and two directories (``weights`` and
 ``goals``) exist.
 
 You can set the ``time quota`` in milliseconds, ``size quota`` in bytes, and
diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index 03f8137256f5..de95cc74b0fe 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -364,7 +364,7 @@ The tuning is turned off by default, and need to be set explicitly by the user.
 As a rule of thumbs and the Parreto principle, 4% access samples ratio target
 is recommended.  Note that Parreto principle (80/20 rule) has applied twice.
 That is, assumes 4% (20% of 20%) DAMON-observed access events ratio (source)
-to capture 64% (80% multipled by 80%) real access events (outcomes).
+to capture 64% (80% multiplied by 80%) real access events (outcomes).
 
 To know how user-space can use this feature via :ref:`DAMON sysfs interface
 <sysfs_interface>`, refer to :ref:`intervals_goal <sysfs_scheme>` part of
-- 
2.34.1

