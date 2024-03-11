Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F7A47F48
	for <linux-doc@vger.kernel.org>; Mon, 11 Mar 2024 15:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710172754; cv=none; b=n1e6tEKRiF7vZiD34l1cbocWgixn5qlbU06wqWyUfijqp1Uj+Jwh2Rc5HyvUT0zGKDk0M+isODl3I9bBCeAM/ZW5jx/SAS+d/UUeC/OzciQ7arIs1sKBwEF4Jbxwki99Or6i6N3o0JzSXujRBY3xWO7Z9h4CemRFOBoC77Ny7YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710172754; c=relaxed/simple;
	bh=18xX4OvWa+leBjLCZv7ewn4yGUE9xohPXWWIi7DpOLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Avc61VM/34ZsuCqjIzpyUJQggptVkupjBtAco9KuGlFdoe3jwogVwmqajXegsHBpjNAufz3yPpSY7WpVQVd5S13f9+8FDhltDeaeFzNoAx0kXvG8VyBZL5BeSdL7ZVS4Zf8wB20P3QJlTQwvwJJIY/RMOCM5rFL92rTUx6hJrDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZyueOB0D; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZyueOB0D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710172751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0DaVe9UI/74uhr3vyv9Mr2EI8STk16ojBYtV0kWhR6s=;
	b=ZyueOB0DVRKzhLQ0LIcB6gBLQLNRVJzoLmc8gJI4xgx0M/Ao/UrglS00EwuJDJ8eObMJ5Y
	wWulOskQFsWGiWq4hE1E5FU6VbgSzliCds21H2UrRVKX/ZjGSCGnIIZNZ/dgUIMNT2YtSp
	34avERJmQNiCQ9lTCOOUphrJgi4cvPo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-0fuM8aADNkiGlWdUvlqP6w-1; Mon, 11 Mar 2024 11:59:07 -0400
X-MC-Unique: 0fuM8aADNkiGlWdUvlqP6w-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-33e80690477so1371103f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 11 Mar 2024 08:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710172746; x=1710777546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0DaVe9UI/74uhr3vyv9Mr2EI8STk16ojBYtV0kWhR6s=;
        b=ZKHQymD041ZYmlghDLC1WatST9e61arXwT4VP7b1XuP+TUdfZFsli611HVJCdlJ7md
         5g+MQkKmbvPB4QPaROrPL12O2Xv5vKDxgouWL01bpRz3WCwj9YO794kWGi0o/hdeo98U
         RZw5Int1akrhG8OEd+CqfTUVZwEcfOD+hcdU+2sda3bT+vYeJqAYbP4p8lvgtizdKBmO
         jvIkY7qlPcL94mVdb9eWxN6nOCfJv7F5K3L0oG/FZ7BABrGqveRhUk+42JefMwh6/62n
         gjFwzffPachQhmfGi2W+absL6UoRjCcGV4tFBFfwh9++y+2CwbyhbwCap/bTyELBW5kq
         0KLA==
X-Forwarded-Encrypted: i=1; AJvYcCVanM/m2qyaboKW4jdJyQsF50JH94txktN5PVY/15dXxmsO3eDYk0He3EuM+Dxh+//DLhXfuGKeM0HqAUOvkzIestmZmkLb5Iwd
X-Gm-Message-State: AOJu0YzMlc7xC+3EQRM0eA0Oy1zkEVNEdpF78Q4PrJUWfm/Hxiw55RJp
	EoPi9jeEZ7iAkr5cPYKETHdDlGD6aI7+RRL5z+tqlHILckRHDq18sDSJX7PNAx0L7MV8XUsjGyS
	OERprWJi4qQZ0KMDnrBa5DmrsJR79xo3tgsUHowuetbly6mDA9jElA3JPRw==
X-Received: by 2002:a5d:5266:0:b0:33e:7bef:8ac9 with SMTP id l6-20020a5d5266000000b0033e7bef8ac9mr4426690wrc.42.1710172745909;
        Mon, 11 Mar 2024 08:59:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAohlcaa5hCeO6/rNdnXeWXIrJX3SzsKOW0z/TCgQ3k78FXEykJ0N240bYuJJMlujXGYrRJg==
X-Received: by 2002:a5d:5266:0:b0:33e:7bef:8ac9 with SMTP id l6-20020a5d5266000000b0033e7bef8ac9mr4426674wrc.42.1710172745566;
        Mon, 11 Mar 2024 08:59:05 -0700 (PDT)
Received: from toolbox.fritz.box ([2001:9e8:89a8:bc00:4f1a:435e:d5a8:5d5a])
        by smtp.gmail.com with ESMTPSA id p12-20020adf9d8c000000b0033cf60e268fsm6774274wre.116.2024.03.11.08.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 08:59:05 -0700 (PDT)
From: Sebastian Wick <sebastian.wick@redhat.com>
To: 
Cc: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm: Document requirements for driver-specific KMS props in new drivers
Date: Mon, 11 Mar 2024 16:58:58 +0100
Message-ID: <20240311155904.323488-1-sebastian.wick@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When extending support for a driver-specific KMS property to additional
drivers, we should apply all the requirements for new properties and
make sure the semantics are the same and documented.

v2: devs of the driver which introduced property shall help and ack

Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
---
 Documentation/gpu/drm-kms.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 13d3627d8bc0..b98b98359c90 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -496,6 +496,13 @@ addition to the one mentioned above:
 
 * An IGT test must be submitted where reasonable.
 
+For historical reasons, non-standard, driver-specific properties exist. If a KMS
+driver wants to add support for one of those properties, the requirements for
+new properties apply where possible. Additionally, the documented behavior must
+match the de facto semantics of the existing property to ensure compatibility.
+Developers of the driver that first added the property should help with those
+tasks and must ACK the documented behavior if possible.
+
 Property Types and Blob Property Support
 ----------------------------------------
 
-- 
2.44.0

