Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101410;
	b=gT2aSYikFyOVh0MQ+q9PIEAOHzXseb1hQxBK79WHXwhuePz7KdR9EiesETt1jMr23oBn
	 qhgemOXeNEAiL5WU5tVk9Nw5pqQFoBzvsjtIVebySQL/cpm97pAncqMp8VAyKj7uTgWP+
	 V9B3ICcSCThlEVUBo/BAHsD/4DmoodwPgKiAaeQCPr3sLhfCrW2KzRx6tazjYR+eUscTP
	 T3kqkY2WiEdnN394Ps8gwUCKjL/PW97W21HLD+SEXHwnUj/4UKIqJBB2BoqX8ETS+uOXO
	 GqfHr8vJB+yZsdVadRVvvcyANCNtXpEdLB9Xh7djdJEbhjLr+brVFhEGHp7Z8WgxowA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=qRj5nmSVr8oaHYTfwp3nV+7muLaSPF1hwSVuKOsZ4eM=;
	b=fDyPqFNGJWXnZ8AjgGO0r03YH3crI6E9lyugWXHvuvytDnwQPwby0J9xLsFURu0kNSiR
	 KXOqHBy+kLcOWuo1VarUtsiMyQAeZRHLxGzW3Bh9iwTGYSJWffZjI49w4qFlftV22UsLA
	 VxjEmWTqxW1xz/cm7zNa+P45udOUWF/EvKHTLOaRkhmZmrAmdYD/7Hk0/a5aSbTxYOMeX
	 0N/5zodpqHCm2zo1TkGy4Ek5H4SQx4TZkjcCv8SJFHCbzRiSD4HBgaz4db//8hKE/hR2O
	 UmZ6Nu7negmDbNCjUs7tMDMd0TzsNEq9smCuYoCcjLrMZX7qo/70lyt566pAa6Z2J2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="iBOg8BS/";
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A8D606A9C1
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 11:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14A8D606A9C1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=iBOg8BS/
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1711308a12.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 04:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793101409; x=1793706209; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qRj5nmSVr8oaHYTfwp3nV+7muLaSPF1hwSVuKOsZ4eM=;
        b=iBOg8BS/AfD0VOTVMWP3REB+11vPV7w0ToTM56EJrWZAxVXDxPmG2MqW8hvNvUbI+l
         YLBtKH1cr2sx6cgkWNqYFi3Vz8TZKPEM4+mP4lXO1mL58LsaQeFs/aZsyjGzeSlcZ0Lb
         r9YN/CYxzdAX9OSGZqJcz9kVZHtlPumWOo/gM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101409; x=1793706209;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRj5nmSVr8oaHYTfwp3nV+7muLaSPF1hwSVuKOsZ4eM=;
        b=wN8QxG8OkE829KRWSjx2MSRccErcRWrn5Jui1xgheiji5hNOTAe7yOwZYsgX6sO2q2
         ioMCOyc42oWWoTebKJZGD5uDXVcEDjiRHlkOO5hayr6nKFpC0KnZPkSzFAkjgGLfr6oa
         3DXSOGl6G5qyXg/m9bWM95kmVBU4ieBliP6+BnwOxLNq3/TDcokH4zvBlqzkwktTbKPc
         Q4n+wEqmypbIdJPichlKyzRnyq0fcTepWxkJrKU7veMOWOomHUIzZOsVArK2vxeamJeE
         /zBBDxC4lIJvGdx/RADzvKnEHlg7IiHBMsde2dngHg5i22LFM9GEUyYaQP7gJO730Pg+
         QJgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSoFriU+Lm0pI15svqEzgB0bG3S5OK7nixXzV324pus6F55WhTrJs00qg/yCvgSHjWS/uoGAwOKXw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeOB2Q5XnNgsrZAQKugtTx6kp+wqTRs9+MFytTyQ4mYUwezaqm
	n58WgA9szofHcxvu6eMJACPrdEfjpnWsq9CnVcJVrctFzVnXClC/9o2RYm2B+QKziuU=
X-Gm-Gg: AYBFou3ZFM5l39WG/yjQaxSl9lHdWAdT93ZplxR1IC+VvBzbLc01zY8zZVs85pmrxS6
	vGe4z4AteiRbOB0CV5jIQwLSuPEeZBqDXLxYzxgz5klU7xg0IXndqHvITsBd8hgk9T250qnfpfc
	z9lG2W7kR8YR5ipYdjzOgXQlKbaSMJ78irko6D+HNbCRBxuvFt83CxikJQixw8aiWeMVTZ9rIwR
	ypQyfaXMjiUB6x22hDWMYbN49hooH9h9o8bx1eOdOfvlJGSLV3CBSd0qzBiQqBGpuFjR48g6/5P
	BXTiTA3kU2TJiEgqZkHVUf2UNUp6LfCG557gw3gIFBtaNslgP8r8OJF6dQKqg3aTDm6sKkp+CAt
	o7kxHLXWU7uyMnOz5YM7iXps61ePCPC5GttGf2Gy2MYm5TfFxXNGtUKiRvHm68Wf07Mb2Tx06rf
	jfeyCqnrzV7aVl+ro/mCDE2BvLGo9qdwpwgsLzihnm5ntfrEQprm14Jw5GPBC0djhsHZrmF+x8k
	Um79WBeV2cu0fvOLDU1O45JScRRJapliLX1DfVpCS45TX3TnRhVck90kWidp96Fct5lc0SvO85Y
	T3sdJmmtDIyp4Z/ieqFtOQlTdiibwv22V12+YGAQ0GAASJ3zvb4bcB+ZLmXxn9Ezxjc0/k3gEaG
	IGRWa0+VIKcNAFpHr92h63bw=
X-Received: by 2002:a17:90b:35c5:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3adeafb079amr6566975a91.34.1793101409391;
        Tue, 27 Oct 2026 04:43:29 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adf8f3f22csm7120822a91.3.2026.10.27.04.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:43:28 -0700 (PDT)
Date: Tue, 27 Oct 2026 19:43:25 +0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>, Kees Cook <kees@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>, Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH 3/3] selftests/mseal_system_mappings: Test vdso unmap and
 remap
Message-ID: <621847973ba2ec49d0a58e0261da35a9f3a97eda.1793094611.git.chris@chrisdown.name>
References: <cover.1793094611.git.chris@chrisdown.name>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793094611.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../mseal_system_mappings/sysmap_is_sealed.c  | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c b/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
index ea75ad537620..83b4fadfbfe7 100644
--- a/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
+++ b/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
@@ -10,6 +10,7 @@
 #include <unistd.h>
 #include <string.h>
 #include <stdbool.h>
+#include <sys/mman.h>
 #include <sys/utsname.h>
 #include <zlib.h>
 
@@ -232,4 +233,95 @@ TEST_F(basic, check_sealed)
 	EXPECT_EQ(expected, sealed);
 };
 
+static bool find_vdso(unsigned long *start, unsigned long *end)
+{
+	char line[MAX_LINE_LEN];
+	bool found = false;
+	FILE *maps;
+
+	maps = fopen("/proc/self/maps", "r");
+	if (!maps)
+		return false;
+
+	while (fgets(line, sizeof(line), maps)) {
+		if (strstr(line, "[vdso]") &&
+		    sscanf(line, "%lx-%lx", start, end) == 2) {
+			found = true;
+			break;
+		}
+	}
+
+	fclose(maps);
+	return found;
+}
+
+static int vdso_is_sealed(void)
+{
+	int sealed = -1;
+	FILE *maps;
+
+	maps = fopen("/proc/self/smaps", "r");
+	if (!maps)
+		return -1;
+	if (has_mapping("[vdso]", maps))
+		sealed = mapping_is_sealed(maps);
+	fclose(maps);
+	return sealed;
+}
+
+/*
+ * Unmapping or moving [vdso] must fail with EPERM when it is sealed. When it
+ * is not sealed, it succeeds and leaves glibc with a stale vdso pointer, which
+ * is fine because each test runs in its own forked child.
+ */
+TEST(vdso_munmap)
+{
+	int sealed;
+	unsigned long start, end;
+	int ret;
+
+	if (!find_vdso(&start, &end))
+		SKIP(return, "could not find the mapping, [vdso]");
+	sealed = vdso_is_sealed();
+	if (sealed < 0)
+		SKIP(return, "could not read the [vdso] sealing state");
+
+	ret = munmap((void *)start, end - start);
+	if (sealed) {
+		EXPECT_EQ(-1, ret);
+		EXPECT_EQ(EPERM, errno);
+	} else {
+		EXPECT_EQ(0, ret);
+	}
+	EXPECT_EQ(sealed, find_vdso(&start, &end));
+}
+
+TEST(vdso_mremap)
+{
+	int sealed;
+	unsigned long start, end, size, new_start;
+	void *dst, *ret;
+
+	if (!find_vdso(&start, &end))
+		SKIP(return, "could not find the mapping, [vdso]");
+	sealed = vdso_is_sealed();
+	if (sealed < 0)
+		SKIP(return, "could not read the [vdso] sealing state");
+	size = end - start;
+
+	dst = mmap(NULL, size, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(MAP_FAILED, dst);
+
+	ret = mremap((void *)start, size, size, MREMAP_MAYMOVE | MREMAP_FIXED,
+		     dst);
+	if (sealed) {
+		EXPECT_EQ(MAP_FAILED, ret);
+		EXPECT_EQ(EPERM, errno);
+	} else {
+		EXPECT_EQ(dst, ret);
+	}
+	ASSERT_TRUE(find_vdso(&new_start, &end));
+	EXPECT_EQ(sealed ? start : (unsigned long)dst, new_start);
+}
+
 TEST_HARNESS_MAIN
-- 
2.54.0

