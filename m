Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383610;
	b=RwTMT5Ou6z6njMmwZB7Io6l2puuAv9Iwv5d/rEcRX5TgZs/6ygoy7f0AQLlbNg5OGGtD
	 jLqH7FF9QOGfAGHKjHkAA4TuC0fuj64qYIfHkjz1tZKj3Tx6pBCbPC4M04jwSw7IjP7gA
	 q5JRiIq/D+efDR0EWkcWEq0uNRsk9wp72RzIBjl3zcWBN3NpV5lP0ErBs3bIfv5WAqrKw
	 JLH1CHouT4Nn34/1v7esBxvrw/PQqlJgKuDCCouDgY7M9XK3kdBpuUdjxaKSNocKaoBJe
	 YFRetU+DBZPGBTfZK9FwYX/fUcx0/r2EpPo3AeixtPlKaTUWDs8ZjOsl6pCnHjUVBmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=pnMzGzAa5g0/2fGWNckudlYHrRY4wmAMpp2a4sY0JEw=;
	b=cOPGZfX0zgsfFIWdwnF0c6EPwnbKHBg+Ltp9o6d+IcnZ1jNUwK7Iu4yBpZCaQBW4zh8y
	 oKdfuUdpZCSZAJ/hiP37zcw25+9ZL76fZwaCU5Qh6WuY1HD0wmHORp63iHE5OF8Hvk4vF
	 bNKwi0HAI9EfWDsILUC4+3xJ9+Ec7qQ4mVgamQQMhiBTmw9PSN5+anZw8SJjtYDZgZ/uR
	 SOeHZzQs47emcRM5+UEyTkxCusWuYTfH1WIrtcuvL4gaquhCO+aeG7WfIwhyFU9KeAx8B
	 MzPJQY6F2qeUYZGHbrKbT9pZrvbfXWsKG2bD8a5VwkVHoB5ppIKrsGbYiA69xGbq3pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=dNqFAY6c;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9139C606A32A
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 07:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9139C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=dNqFAY6c
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b467581b98so26279365e9.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 23:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794383609; x=1794988409; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pnMzGzAa5g0/2fGWNckudlYHrRY4wmAMpp2a4sY0JEw=;
        b=dNqFAY6cZ3CyL5eJVVr35UwikSopMOTqlFBpWR/MyFLq9799tN3W3BSglylopd0rYS
         RqKgJy15r+m3b5FB4xABsCe78mdqRMSgupv/nVYWHFL6rGAdW2OGZ6fdVNFTzRC5TePK
         qHrOSaRJcOxBCr4EMtMQRV+q3DlxSSIQJ4FMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383609; x=1794988409;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pnMzGzAa5g0/2fGWNckudlYHrRY4wmAMpp2a4sY0JEw=;
        b=XLkfmJ+K9zLmFTsH3UCNva4TKmUduTW/2EY5vrzgR1tgh4aJ3rrOHOr6jJGy4ZzM4S
         0Q+Yii1yr2ZiSCmeNBtYxgSJ3oemNo11fjC4GnuowIHA/+AgC62U2FPIcPg8FD0o/274
         dXpYg0ZXhNFNBntD5cx3SrX0se1tgwnab5Fp4Fi6qJav6QNsdDEg0HaR1I3nQ/ZalV0+
         sg22z3RqHkudOsYo54XaErKZRX+HH4Lqs6UVgDs/uF6OQCaNWrO1HBqh8PIiGlAXv/QO
         NdVygWUFByiAlNL5q9ymY5HrFbgmDhmUdOIXwMOkO05PKtWSwVoMJwf5GUa5sIteGA4x
         9Niw==
X-Forwarded-Encrypted: i=1; AL+hErHkPiHsGfd4ZjWSSYFvOsk6K4Dtglj1CwLAsbhDh1XtQLn8IcrwOVuQ9kOH3bFt4kRhc25Lfa1BseQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PtnEi4ODM/5GbWuWPYPoANE2sJ3514RzghCrZmT9CbDs0HLVE
	ziegAHgfE7ZkTs6MdrCqvUeFJ05dD66958lpUg4iHcHeDaKu0lGPMCHCuRfxeql1ROw=
X-Gm-Gg: AYBFou2wOspBIZdumgY01bsTWUl5+wzr/fJIrKtyiyh5YFqyyaARJyJQEnpck9aYbjf
	f+yFv02xbl3r7m2O+Y4fHiVp27OLc//rElSpv4HZtaMXPh540dyOlMGd8uwn9r0AfzmC5dge3xl
	PUimRoOLeZCaRCpKgBB/jMmpCq1z9LMgjamYoT9uV4YikYesrn94mtkcZnL/0mG9axD5lpxiWJi
	QNc4q41Im/qYSfDM+ANOdcvQnqlBQHNn4Iy1QMvlP5nCLL/Ebganr7o8mJVUyi06kvu9dkGDxUC
	l2bS5NUTUmAQ3Q2E8S4m+O8/Fw3Mncismpc/BfJNbNpou2jTb5faM4+SyDLO7874mAr9zJr77BI
	r+8x7RRgToSA3vPqPUqu/KKJMVLs5VxzEeRYJyDGAs4cpHJqh76nmZLDAfPZfjk1ioMT4u45T+2
	Lzh0vZMmhUWaWJ6vokdpjvnbzTavY2GGcaxd/RY0uCx87Ukvhf7OWPsngrNJ50uy16ITX1pDUcZ
	EB0Ea19QDYiQtLqAdtXuYK8U/ADROUmMlfNADR1+5zokZ9cNBpZ/jlIMWRk0d2t7KbSWPIAYshb
	0g86op2II/XbSLgGOoU2atzgwmcQtsT9kKxPJ+AmtV5QlwLdufYH+ECPp5CB+ucw3T1GFOhaDfd
	s71/C5vBx1v5AeMFQW4dW0kHHtN2f+8B+XXeO++CmHuoZVif8M980tx9q47gm0ma8invKCaU8mf
	lwbTVhfDS2nCSnTosPZ6eMoAB1itffIZApW2UXMhxpFWSpd2PzTWNl
X-Received: by 2002:a05:600d:16:b0:4ba:4395:56c9 with SMTP id 5b1f17b1804b1-4ba439561a5mr11281775e9.26.1794383609006;
        Tue, 10 Nov 2026 23:53:29 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49842f2a1f9sm9790339f8f.15.2026.11.10.23.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:53:28 -0800 (PST)
Date: Tue, 10 Nov 2026 23:53:25 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 5/9] selftests/kho: Catch missing or zero bootmem reports
 before kexec
Message-ID: <2edf50f498070047a363420b890cb7ff0294b87b.1794383544.git.chris@chrisdown.name>
References: <cover.1794383544.git.chris@chrisdown.name>
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
In-Reply-To: <cover.1794383544.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

The KHO vmtest can pass even if the bootmem size is no longer visible to
userspace. Let's fail if /sys/kernel/kexec/kho_bootmem_size can't be
read or reports zero on the KHO-enabled boot.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 tools/testing/selftests/kho/init.c    | 24 ++++++++++++++++++++++++
 tools/testing/selftests/kho/vmtest.sh |  1 +
 2 files changed, 25 insertions(+)

diff --git a/tools/testing/selftests/kho/init.c b/tools/testing/selftests/kho/init.c
index 88a41b6eba95..ca9297d896d3 100644
--- a/tools/testing/selftests/kho/init.c
+++ b/tools/testing/selftests/kho/init.c
@@ -18,9 +18,30 @@ static int mount_filesystems(void)
 	if (mount("debugfs", "/debugfs", "debugfs", 0, NULL) < 0)
 		return -1;
 
+	if (mount("sysfs", "/sys", "sysfs", 0, NULL) < 0)
+		return -1;
+
 	return mount("proc", "/proc", "proc", 0, NULL);
 }
 
+static int check_bootmem_size(void)
+{
+	char buf[32];
+	ssize_t len;
+	int fd;
+
+	fd = open("/sys/kernel/kexec/kho_bootmem_size", O_RDONLY);
+	if (fd < 0)
+		return -1;
+
+	len = read(fd, buf, sizeof(buf));
+	close(fd);
+	if (len <= 0)
+		return -1;
+
+	return buf[0] == '0' ? -1 : 0;
+}
+
 static long kexec_file_load(int kernel_fd, int initrd_fd,
 			    unsigned long cmdline_len, const char *cmdline,
 			    unsigned long flags)
@@ -61,6 +82,9 @@ int main(int argc, char *argv[])
 	if (mount_filesystems())
 		goto err_reboot;
 
+	if (check_bootmem_size())
+		goto err_reboot;
+
 	if (kexec_load())
 		goto err_reboot;
 
diff --git a/tools/testing/selftests/kho/vmtest.sh b/tools/testing/selftests/kho/vmtest.sh
index 1e86ffcc3a79..e3e99cfe3ac1 100755
--- a/tools/testing/selftests/kho/vmtest.sh
+++ b/tools/testing/selftests/kho/vmtest.sh
@@ -95,6 +95,7 @@ function mkinitrd() {
 dir /dev 0755 0 0
 dir /proc 0755 0 0
 dir /debugfs 0755 0 0
+dir /sys 0755 0 0
 nod /dev/console 0600 0 0 c 5 1
 file /init $tmp_dir/init 0755 0 0
 file /kernel $kernel 0644 0 0
-- 
2.54.0

