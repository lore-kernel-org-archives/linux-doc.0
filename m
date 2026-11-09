Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187395;
	b=BKby5cAlfvvFbIUCL1FDKuV5qDjx1ed6Ozh/qxfpuk1T9ECaRtGUU122Azw1s5b8BYV5
	 Eq1KXwISlFWP984EBLG2gS1CYuPmsryZxWA7Pjbpxzjpk79Ln2kMlZHDAId9QlDABy4Xz
	 1W8NH5ng21GINPPXud6fFrv+plMrHyCiqlawUfJnXKFwtCB2Jj7xMOh/VaKS9v2WSPqLh
	 ZVFLH5KZJVsgQBeMM3OMOYKwif0gxEkD8oIqUjFjIINBehAcdYmGVXRQxw7pRJY/6d/pz
	 jYELft4z8kYfNbkxyy7oKQz6HOEXLjwiQw/DnJR6RywbDMpKZlyqPEI796Q90uO+2SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Yd5+TdsEc/1kR6XeHOmWBxFOLTJkBLfiUyBjyyrqsyk=;
	b=tY76EAHis5S00Jrsqdxkf4xWX4OB55PHYDj7WVlqjB/v0MzGkQQEu+A4b1pGG2GyyqQ1
	 KW17h1SmmPovADt8IwWPMcNQZ2zs3RwepsXkB/8CWAJKJ/Kpk53vOOWmw0y+k4zsPwI41
	 RowsJa/vYHANaJkwZCK5RuTjPUZQ5njE9cgEZI1Qq6oHaKersgchuG1+ZpwwzXBXoITCX
	 uLtq8/P+jVh62NQ2n9xW52PPYGENUWWK9sO/v3HhQBu2B6onFncpGEMo8MS0y5t+S1bOv
	 UbpEImLumCsOG59aeJ62E+lZxGd0KnL0yhuSQOAyrWaX6P5fd5JwToBOj4i49DDsovA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="M/YJbBzw";
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB74606E984
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 01:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEB74606E984
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M/YJbBzw
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1ae58d17cd9so82872c88.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 17:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794187394; x=1794792194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yd5+TdsEc/1kR6XeHOmWBxFOLTJkBLfiUyBjyyrqsyk=;
        b=M/YJbBzwhR7G824BApq9UpMteqyazdlfLXmqEzjBWffbJOpvrxEn74LfEgTvdoSsFJ
         gwZjE5z6qzdfmHWGv7QjpYwKK/0SzJq7V9/MBlbN0vkwnfblCVV6pFLW9vMx+hFF3uGC
         nXQul+AIMV47VTE+XY1Nol0/2GfX3A0JaERyg3e5tx6u43JD0dv73IZnNCu+9+x3nfwp
         lM746MazS/FYhc6TZGdozxcewIFQVxpsXopAdT8zzrNQjEEsQy92MZayAA2QKJr7VkdF
         sg4TrVPYUqyaLU2UsCS83+nzJDBo5xZ0lQUA/wjxGwvZiMMnOLfsGiO5CBkaPnJOipTh
         brtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187394; x=1794792194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yd5+TdsEc/1kR6XeHOmWBxFOLTJkBLfiUyBjyyrqsyk=;
        b=n+xtmL5aCm9Y8GbLEKgpAYh+qw64yNAYjZxPjf6UCQe1Z8jdH+zrSy8XaRtCCof0ba
         0NA2xDxHGeKiWghDoPSHiYvN+5priJf0fxKH/wZDrabncJlMME2BkFsd2nCRSF92ZHoV
         EaWfMofpEUMDcgTydWCdK1Sp3enaYHnUXpsI75lK+pZSeeBBbsF8CEl6bJHWII+bfEpo
         gKv1eMXWskWX6cU8s97g07rkpQj1HY6Ar8pPzJzDgE4cPoI6hu6OogGAj71mC1lTEwHI
         saJYfBfO5Mzf4rERyLUlPdu+5s2Z5CpFqgxfCuD0KyPYEka/lXDS6HkYcRdRzACKO3mb
         bDkw==
X-Forwarded-Encrypted: i=1; AL+hErHjvURtTDJhpV0a/uUKzxUKlBqH5TsHZ1ZJToPNB+C05dYsTHsdx+yQKS5AqE9GLS3NOy3e9+dF9xA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rYvAG0BDDkfhPQqk19Ny9CpL40rdiVSU7tEh1YHFUwco4w52K
	NwDTMGjIcwznXUHJIPfW8nV15eQQSGjM7O904UFc2e1Xie/qecRFzUVi226KntR05Hg=
X-Gm-Gg: AYBFou2xC9bmNLUtJBT19WpuEA5ZlaeDc89aP9rjewkYruQ3w4uiTFSpeoLsc0b92dI
	CFHNbcNSY5EJyTj+mOez4aT6Ss0efllM5qAsmgLIyWaMWQvC3tO7VvnnItWbYYAMNqJQSAMn7DB
	fo1f/9PZiAtF/jXxjD0FKSmfjyaVvDrJQcJ72Iv18hVdWcq5DjW2XGHzfhpOeVEAuopPRPSx9ag
	Zc4H0LNWB5+b91FIvymwA88Gpoiw7NKkjv7oFCMsnXYwCTSwWRZo/gucHDC2gK0M/WzcaCDhqxb
	Q/nEcjgrJwpGq4ii9ZerSaGILchGrZuS+Vh7/VNLqyMvN/pkunnE0rRYbXsI/vyRl9wltsRGilZ
	5MvzDqqFH8BaIq8qmMzehKaapkS3uch1TpnE40VLi90QV9Ttvd/+8FgCfITU8NeXQbdDD6XuI3o
	PHMB9F+iItW67da9uejna4oSdalQBeUrIs5W3CTtdENKN5a5LT5xcerIE0/SS2L4VoqnYgoj0sI
	i/i+yOFL5BS6Tt7yAv+310CzFIV8j7UXrFC/SMSQ6PU0XEAt5AQRmOmuPIuHsqfmf1duwiCHQaR
	DRwH6lyQXk2XVzPAYRh84iDp
X-Received: by 2002:a05:701b:420f:10b0:1ab:6b10:461 with SMTP id a92af1059eb24-1b39ff1d2famr4082012c88.45.1794187393835;
        Sun, 08 Nov 2026 17:23:13 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm9428226c88.18.2026.11.08.17.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:23:13 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sun, 08 Nov 2026 20:22:52 -0500
Subject: [PATCH v4 3/5] selftests/mm: fail KSM helpers on short reads and
 writes
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-3-86be8fe77e7a@gmail.com>
References: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
In-Reply-To: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

The KSM helpers in vm_util read and write KSM's sysfs and procfs files
with a single pread() or write(), and return -errno when the call does
not transfer what they asked for.

A read of zero bytes or a short write leaves errno at 0, so the helpers
then return 0, which their callers take as a value of 0 or as a write
that took effect. A short write of run makes ksm_start() wait for scans
of a ksmd that never started, a short read of full_scans makes it wait
for scans that never seem to complete, and short reads of
ksm_merging_pages or ksm_stat and a short write of use_zero_pages make
cases fail that should have been skipped.

Return -errno only when the call fails, and -EIO when it transfers less
than asked, so that callers skip or fail as they do on other errors.
Forcing each short read or write with an LD_PRELOAD shim on
ksm_functional_tests:

  short read or write of   before                    after
  run                      cases fail, then hangs    all skipped
  full_scans               hangs in the first case   all skipped
  ksm_merging_pages        9 of 11 cases fail        all skipped
  ksm_stat                 zero page case fails      zero page case skipped
  use_zero_pages           zero page case fails      zero page case skipped

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
The checks come from 93fb70aa5904 ("selftests/vm: add KSM unmerge
tests"), 3d0745e59c84 ("selftest: add a testcase of ksm zero pages")
and 42096aa24b82 ("selftest/mm: ksm_functional_tests: test in
mmap_and_merge_range() if anything got merged"), and b27f292de6b1
("selftests/mm: put general ksm operation into vm_util") turned the
use_zero_pages check into one of them. There are no Fixes tags, as
only short reads and writes forced with the shim hit them, and the
helpers are in vm_util only since v6.18.
---
 tools/testing/selftests/mm/vm_util.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 515031b8283da..caea045fa7d46 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -920,6 +920,8 @@ long ksm_get_self_zero_pages(void)
 	close(proc_self_ksm_stat_fd);
 	if (read_size < 0)
 		return -errno;
+	if (!read_size)
+		return -EIO;
 
 	buf[read_size] = 0;
 
@@ -944,8 +946,10 @@ long ksm_get_self_merging_pages(void)
 
 	ret = pread(proc_self_ksm_merging_pages_fd, buf, sizeof(buf) - 1, 0);
 	close(proc_self_ksm_merging_pages_fd);
-	if (ret <= 0)
+	if (ret < 0)
 		return -errno;
+	if (!ret)
+		return -EIO;
 	buf[ret] = 0;
 
 	return strtol(buf, NULL, 10);
@@ -963,8 +967,10 @@ long ksm_get_full_scans(void)
 
 	ret = pread(ksm_full_scans_fd, buf, sizeof(buf) - 1, 0);
 	close(ksm_full_scans_fd);
-	if (ret <= 0)
+	if (ret < 0)
 		return -errno;
+	if (!ret)
+		return -EIO;
 	buf[ret] = 0;
 
 	return strtol(buf, NULL, 10);
@@ -981,7 +987,9 @@ int ksm_use_zero_pages(void)
 
 	ret = write(ksm_use_zero_pages_fd, "1", 1);
 	close(ksm_use_zero_pages_fd);
-	return ret == 1 ? 0 : -errno;
+	if (ret < 0)
+		return -errno;
+	return ret == 1 ? 0 : -EIO;
 }
 
 int ksm_start(void)
@@ -1002,8 +1010,10 @@ int ksm_start(void)
 	}
 	ret = write(ksm_fd, "1", 1);
 	close(ksm_fd);
-	if (ret != 1)
+	if (ret < 0)
 		return -errno;
+	if (ret != 1)
+		return -EIO;
 	do {
 		end_scans = ksm_get_full_scans();
 		if (end_scans < 0)
@@ -1024,7 +1034,9 @@ int ksm_stop(void)
 
 	ret = write(ksm_fd, "2", 1);
 	close(ksm_fd);
-	return ret == 1 ? 0 : -errno;
+	if (ret < 0)
+		return -errno;
+	return ret == 1 ? 0 : -EIO;
 }
 
 int get_hardware_corrupted_size(unsigned long *val)

-- 
2.43.0

