Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356656;
	b=whW43on8/p0pmvNB+dGTzSnzdPRnszezfR42gGDcQHN3z/s6SPyjjpTKHI3Y2dwpWE3c
	 x7y8kBqx6JVsinX30ReT22SghaJJd+bX3BCFMBnrnUc9B7a7frCCtLmPXZBzMkJKK5daa
	 YR+fYAGHzxe/5kYf14H88nKKeFRRP9PUZaBzfmjOgIl/EbCqUMbwCg/qKFYubFfOUMDHG
	 MCxuH23syVUIT6zzXe4F8rraaDkrNeBTMVojPabd0FiwWfApxK8xoojgkHx3LqQs+S4jh
	 SkLF9kZ049BA410AQkGTaro8Zn5VGIvvx44+2NQZR/dFhw9zzs78cIq/3ny+D2R5auA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=wY3MtbwEI65ANl7uiD47g3ph74JfuhEnWdITM5snLF0=;
	b=FPi/U2VLALl0KB0Sg1jgUF3J5A6pLQsYrJSBx+92Hva65HufPvmQFUtEFBiQHYmc1G03
	 R+zQso1G7Dm1XM0FQqhaRfCPIWmYKPSaHE1s3uLJHAYLUnO+Rb7vK9QU8UrTEAP62Hs4w
	 m9FUH0pliPhXWWKouQDc25j4EVmIwBbgUijEB2O5tdbSs+SAczGsMBviJOJnkOFJOLZ7L
	 MovYIfcYDfCdvnyqLDDRJJ4JhtelXjBsurSsbEhjEQS9DGB+GkfQszSIQLH+gjz1ii476
	 idPmOCdqQEoo2gR+o2pN/fKCBtV2bN2/RitTImUZhuAU2vI3y4CBw3c6Riwf8jdGBTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XCJJCbMl;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D0E60A3816
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72D0E60A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XCJJCbMl
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4cc89e86e4dso3329692b6e.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 16:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794356655; x=1794961455; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wY3MtbwEI65ANl7uiD47g3ph74JfuhEnWdITM5snLF0=;
        b=XCJJCbMlXUal3ePEpojPrIAVDW8H4WcSwjtVolZOUXJNDapNSgxHjOVdWdWjlQZM6I
         oLlcwW6yPVilSNsDwxFshSn9nW2tW1g+oZe/Op/8a6+qtoUEP9yI2JnQfB4c+V00+7tG
         L2+q25E9PEVxD7j9X0HpSHXJjj54/ZtpFYni4eZEBGe/AFtYVWoWrtabpwCLXGHtxRHE
         3eZIKtW4DyWrypharbA64hYUWNOAD5I5vCIqjeMgyOUHlC+wV0dBv4seintMiSHznEGh
         YO3mjhQuJ25ifhx5QtJoMEUfJ0X7KaG6xHu38XJcOxBNcvT8ESWbgGTI9DwvMe+mycB+
         tiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356655; x=1794961455;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wY3MtbwEI65ANl7uiD47g3ph74JfuhEnWdITM5snLF0=;
        b=cwJTZCjMQLeRUjl2RA6KC5xkjb8s2Vrqzl8vPQ3ofr6wyTCYNX61nleEkqFFVJ9mOf
         KoUW5ExcS9L8ODFG8RzCSb2ltMpfdUGyxDjbH8wPmBepw+xuib2eB5rbF7KXtQ2sHzJU
         uTkCSR7XNichGr6mp3j/hnKDzBcL1W0ia2z2CE3VDkHXE1SFdt58q/gioaWIT8zPSTof
         mdOysyvSqPzVZBBgYGqA7aJe2O3tJUCPwr1AUpr4dwbMmxOkm45FG3TBXQKYsD6eeHht
         HJ2MLfOaC9OnUMi3b8T6IHPXQQrgATtoHCe1NXETlpA5ncpjv7HDfbbBPB7eykIq8uQY
         W6mQ==
X-Forwarded-Encrypted: i=1; AL+hErGoNrvIqnV1ttuhlLKODvttDj1SHv6iosNPDFZtj5xjpYLc1jQh+yR3XGdHRtnSmkYZL3tvQ8qltes=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QDEi8+038gpI97uyS1YPP7yZSpXU4g3TWloWFckslzklFqcPf
	Nvm0biViGja+vvOGy0RmhS/AV8IrcSRmfFQgN31L4zTzXoWXhdEYWf0jMQIRYAv2s9UEV77rFcx
	qqWs1FL1OjySaBw==
X-Received: from ilbec1.prod.google.com ([2002:a05:6e02:4701:b0:523:5388:be99])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4443:b0:4cb:f21b:6f91 with SMTP id 5614622812f47-56b9771429emr677558b6e.36.1794356655005;
 Tue, 10 Nov 2026 16:24:15 -0800 (PST)
Date: Wed, 11 Nov 2026 00:23:44 +0000
In-Reply-To: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111002358.1842967-7-dmatlack@google.com>
Subject: [PATCH v4 06/19] liveupdate: Don't WARN if tracking a retrieved file fails
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Handle a failure to add a retrieved file to luo_preserved_files instead
of triggering a WARN_ON(). Make the failure permanent, and keep the file
until the file set is finished, like any other retrieved file. Only warn
if the file is already tracked (-EBUSY), which would be a kernel bug,
since a retrieved file is always a new file.

xa_insert() can fail with -ENOMEM, and userspace can trigger that with
LIVEUPDATE_SESSION_RETRIEVE_FD, so warning about it lets userspace crash
systems with panic_on_warn.

The handler has already consumed the preserved state when this happens,
so the retrieve can't be retried. Keeping the file ensures that its
resources are not released before the file set is finished. Finishing
the file set then erases the file from luo_preserved_files, which does
nothing for a file that was never added.

Fixes: 00d0b372374f ("liveupdate: prevent double management of files")
Signed-off-by: David Matlack <dmatlack@google.com>
Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_file.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 0c9a3b6921d1..e5d333649f76 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -668,14 +668,28 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 		return err;
 	}
 
+	err = xa_insert(&luo_preserved_files,
+			luo_get_id(luo_file->fh, args.file), args.file,
+			GFP_KERNEL);
+	if (err) {
+		/* A retrieved file is new, so it can't be tracked already. */
+		WARN_ON_ONCE(err == -EBUSY);
+
+		/*
+		 * The handler has consumed the preserved state, so the retrieve
+		 * can't be retried. Keep the file until the file set is
+		 * finished, so that its resources are released at the same
+		 * time as those of other retrieved files.
+		 */
+		luo_file->file = args.file;
+		luo_file->retrieve_status = err;
+		return err;
+	}
+
 	luo_file->file = args.file;
 	/* Get reference so we can keep this file in LUO until finish */
 	get_file(luo_file->file);
 
-	WARN_ON(xa_insert(&luo_preserved_files,
-			  luo_get_id(luo_file->fh, luo_file->file),
-			  luo_file->file, GFP_KERNEL));
-
 	*filep = luo_file->file;
 	luo_file->retrieve_status = 1;
 
-- 
2.56.0.542.g3ef89b7020-goog

