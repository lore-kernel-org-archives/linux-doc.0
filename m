Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B90343D9E
	for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 14:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760626027; cv=none; b=Sc5Pk8T07sbmMkLQNUxh4r9+LkL6vvrBwZ7iD4SYtWPxDFHRiomHT6O7uLxip/2x4aGdoTBcK/jIE+6y4baqhwpek3gfACWgu5SW7SIkDAJFaF/awW5l3DvnZMiaQo6XLOEzFotQmjI95ZOoI2chzI5PIUeKbGeLxuj300OVmeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760626027; c=relaxed/simple;
	bh=5Mr6LH7k/o5N9dQgkLvHYmi0+jVFwD/oBoWEfwCDc/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+vh/ilqonzqhnZDPmKj/VgMspAInGPGDcNQ7MSNnxmHl+HqHb/3qUzHtgeeDhRoErWpfz/msZaeWp04e1/3S6K3m89C8VVqnhGpB0LuWSpX1z+i4XD6gtkUjV5vYyxn/FYgPY52fVhkSyH1KBfZy1vPoNC3tB7Gjm53/t+FNq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=yonch.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=yonch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-43f935f7d14so333922b6e.3
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 07:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760626024; x=1761230824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ChrD91ZzeSyIGW13Mo1kwbcyPzEVs4Rp2LDBd96Ha0=;
        b=hG1rfrBVIYKPFI86MM8osyxCkSXicSzYGwmzWXJwdlbE34oZACvOFxIYnCkhGOVRdw
         qS8GDcsNtLJaYz4wDLfpUKUqO6qTdLyhy1fka2G7lDhbIDp+KykbT4AxtSvob1SxLJm2
         iLFQ4vs/UulD4ISh0r+TqNLIkCOyi0FdgLktP9vMzLCGBeC+gVGzeOVW5IDl88YFa6/I
         BgNvBHau2yXhhoegMr+vh3jrzDVyA7n3Iwh8gtgkTyoLZyUVrTJGiTQv/NtE5nAzaVR+
         6gy2+3gCsCERCF6bZP9CXfj3O2IKkdxYbGpod+isy/Bf5XytWiQXYPQ4ptg731nGbGkc
         CZew==
X-Forwarded-Encrypted: i=1; AJvYcCVr3PWfYN4kqu8r/miQefv5eiLqOPsQA+wA5pcsLVrGEMQqYx09kgQA1SrP/vSUscbyBW4OJu+lVGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFo0sNOltLgXxHKopioZTop2w8QkS93VLjo6mixKsiCG3ZlDBm
	UuLtT4hC9Lw3dx3C0L2r0RKu41IDwREiQTGGKGZ2EooRXYLdBkn/z04M
X-Gm-Gg: ASbGncsxtw2/3P6Lt16pyeJnTOr5vQleCQyDPu9hcqdbWquTniVqKyme3PlUh5xO8kF
	3aMWBfq133wUoZ3oJYmW4sHjkzvgcynyF+SrOlQ3quCU9kh8k9rWZfVVBDYMVFQ1+ocxLxYObYb
	BRSD5cLJT8YmbICQ5sDalVE36mkOo2+HrMcujDN7HbU8u8WoUWt+53/MreadjpD9H/DR++rF4Mh
	I5NVeHMW9EYR/PWl13s5qZ/hP6JGaPAjBePA6uZpCy+5xeLP5ygLeiPn6NAnoVc/bidARTO9Srw
	dKyADloPGKlnbyeeJo5JYQfCrygtOiGjNJLR52blPj7GntxeoUtUbGD3o6sbcWYs4W/nXQGt4Cx
	d1NnFsEpZcEg8P0tFbAJR+DheQlZaHhzXUKj2+NfQjZj5nuLlnf3AT3pfdJQdAdwViaz15hIKEZ
	7vLsRaavHQMyROYI3eI5j2xjvKjsYwaoyBk4wtuzTP7CgRUCNXIG9hhIYCAa2EXcsfIv6/L8qoW
	QS6cw==
X-Google-Smtp-Source: AGHT+IGuFXjZd7WjvD1BFyxWZ/lTP2idxYYov/LGI6HCXqPlTW9NLsW1AmAB2FZK/Y+DjuFd+yYXvg==
X-Received: by 2002:a05:6808:1512:b0:43f:7a07:44d7 with SMTP id 5614622812f47-443a305da05mr102589b6e.47.1760626024580;
        Thu, 16 Oct 2025 07:47:04 -0700 (PDT)
Received: from localhost.localdomain (syn-067-079-108-173.biz.spectrum.com. [67.79.108.173])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-441cc812f24sm3678018b6e.12.2025.10.16.07.47.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Oct 2025 07:47:04 -0700 (PDT)
From: Jonathan Perry <yonch@yonch.com>
To: Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	linux-kernel@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	James Morse <james.morse@arm.com>,
	Roman Storozhenko <romeusmeister@gmail.com>,
	Jonathan Perry <yonch@yonch.com>
Subject: [PATCH 3/8] resctrl/mon: Select cpumask before invoking mon_event_read()
Date: Thu, 16 Oct 2025 09:46:51 -0500
Message-ID: <20251016144656.74928-4-yonch@yonch.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20251016144656.74928-1-yonch@yonch.com>
References: <20251016144656.74928-1-yonch@yonch.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor rdtgroup_mondata_show() to pick the appropriate CPU mask
first and then call mon_event_read() once.

No functional change intended.

Signed-off-by: Jonathan Perry <yonch@yonch.com>
---
 fs/resctrl/ctrlmondata.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 82f8ad2b3053..f28328c49479 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -607,6 +607,7 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
 	struct rdt_resource *r;
 	struct cacheinfo *ci;
 	struct mon_data *md;
+	cpumask_t *cpumask;
 
 	rdtgrp = rdtgroup_kn_lock_live(of->kn);
 	if (!rdtgrp) {
@@ -639,9 +640,9 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
 				if (!ci)
 					continue;
 				rmid_read_init(&rr, r, NULL, rdtgrp,
-					       evtid, false, ci);
-				mon_event_read(&rr, &ci->shared_cpu_map);
-				goto checkresult;
+						     evtid, false, ci);
+				cpumask = &ci->shared_cpu_map;
+				goto perform;
 			}
 		}
 		ret = -ENOENT;
@@ -658,10 +659,11 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
 		}
 		d = container_of(hdr, struct rdt_mon_domain, hdr);
 		rmid_read_init(&rr, r, d, rdtgrp, evtid, false, NULL);
-		mon_event_read(&rr, &d->hdr.cpu_mask);
+		cpumask = &d->hdr.cpu_mask;
 	}
 
-checkresult:
+perform:
+	mon_event_read(&rr, cpumask);
 
 	/*
 	 * -ENOENT is a special case, set only when "mbm_event" counter assignment
