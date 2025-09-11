Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD44F30E852
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 10:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757585362; cv=none; b=p4+qqgINcYa156++jqvxVutaQD/wbY4TfzCYUVCM+r+nbEiiqA5cWobrCXN9xET6AUdIOt9/Nh37taB0bcB5rtCAzRnLnG2ZAZ9wiFgTd+2HUj/YNR0QmErlyz53sOc5rv96AZbaa3Hx6dHO02UuaT03mdeq/99RY7/lFTA/8YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757585362; c=relaxed/simple;
	bh=DXPAmzLRhKCJobsF1zcsCZQP5SrHJ2XhbHdOBYXU4EI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bdPBifCy+b2obZn7VtyrAr66BJRD9z2HZ+1lBdZhwgoo1lFGcMy75y0nUZMTcZYiUJdcqTlHhGyyiFCCC2kp2zBsxwA9MI5oWMKp1rI8QiXilxPEfRJkh8jh9rvXPP+LuRucfRmAj3U32E8hpibCOymVqK2SGATwDZRbKmK3QVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3VHdKCK; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3VHdKCK"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55f7cd8ec2cso629289e87.2
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 03:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757585359; x=1758190159; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ACqPWjv+lFry9n4EefwaOP3r/fkJ99H7i94e0rX8odw=;
        b=i3VHdKCKKZfK/pFRUQUxM7mxtLWq37xu+RisEF9uRfjo9vIpR4eTecV9Y5Ycngwkbi
         FWFhCtt7eewzxzGbKUgc7xVy31TWN3fCoCr2V0blu0JMhcQtOZuD0rQ0nUed0sh15emM
         DOyQlfN4uLMPkYDF12ae4yXULsxRtWCLQBX58VxOR79Pf5F+s7yy+W3IdGX2AYM9i7c2
         iK1NiLBvghqxfm84qPJITI4wL0VNhjD0gtcKnq1dMLB2NW5etZ7PGMsHfHDsKLEeuakS
         +Y0RCVYE2OYbhBmsrWwsb4QX2nObxujuiKKyhZb/qPgkkZFH/tfFd2aQiKDvO4DzDReA
         ZWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757585359; x=1758190159;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ACqPWjv+lFry9n4EefwaOP3r/fkJ99H7i94e0rX8odw=;
        b=mMLh+Fbr5kDamtIWwS8xYXCbR/eFgvTTG/rKFSrZZ0fEiomGlKLl1VEiywI2G4B8vS
         BrQY1UaCnyxzH9FUOvOmyWLRSYFEIHVvLnAlJUHA0D2zYzwLe7eup/43eAWZ7mobASTj
         7d28p80z6uHojgMrmGJ/W+Oz5N+Mh8wiu0Xt4Tl3ckqTIf3s1f1ncfd4cXeKkYA7GAFM
         AndI9VTxvGqbnVYNjo4mStE1PCIhNjebkzxmYRUcWZXUW065UYgwq/ziVYlSxuCQ4Rda
         p1rTRbYFuyd+0PVuc9uMs3W2lUVEU5rUm5xHNc+O72savov/Kr95ZzKXZNZACNaFm+FR
         oEaQ==
X-Gm-Message-State: AOJu0YwzfTj5INDKvCq9BF5tyCeRoX+WejHlKzY1ypHr79scPNI24kQa
	EEA+t4fE6/icRt92Ry1ZV4BBPI52z/kbLjpAAMgwU67A+b534yHvTNak3VFzSp7XGPZEoEulmhF
	srKJ/vlDDCNEnVE1TUHD4DBFbswU6go8=
X-Gm-Gg: ASbGncuAk0LAQckUoqmhUkjyxbDDm3ZndGjNzIAQRyt9RNhLFQ+MHN3S45FuE8kcDBX
	TKLGA7IZtLAki5OoV2ZX3apEu41f3yG3o1Q8j5fOYsAKTVAolWStRwH//6ZwpIcY1PjgAIkdasD
	PrYZLcUizT2XIYQo5MNsSSA0pTDaoPHsAvpspgDcabG0uwjGuXV6PumsaocW1qpoj2OC1hNArsv
	M2VeGmsvVwjyyNjZV8=
X-Google-Smtp-Source: AGHT+IGzBt1FElOGMuTpwYlplXZ4bVVKpP3VjUm78T1oIOZr5K+AuVDoMZxILU14dmir483PcUUqEsKmGdpkU6YywDw=
X-Received: by 2002:ac2:51ca:0:b0:560:8b86:75ba with SMTP id
 2adb3069b0e04-56261db5e31mr5713328e87.52.1757585358608; Thu, 11 Sep 2025
 03:09:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ariel Silver <arielsilver77@gmail.com>
Date: Thu, 11 Sep 2025 13:09:06 +0300
X-Gm-Features: Ac12FXziD3obB7804GE7gOADx3-kO3uFBxy7SqXpXYHyv39mEIr_TPATqm5aZHQ
Message-ID: <CACKMdf=P76Bf8-zPVO0shnj87AoFV+NCGhANPyP9gHVpYDk3jA@mail.gmail.com>
Subject: [PATCH] docs/bpf: clarify ret handling in LSM BPF programs
To: bpf@vger.kernel.org
Cc: linux-doc@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org
Content-Type: text/plain; charset="UTF-8"

Docs currently suggest that all attached BPF LSM programs always run
and that ret simply carries the previous return code. In reality,
execution stops as soon as one program returns non-zero. This is
because call_int_hook() breaks out of the loop when RC != 0, so later
programs are not executed.

Signed-off-by: arielsilver77@gmail.com <arielsilver77@gmail.com>
---
 Documentation/bpf/prog_lsm.rst | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/Documentation/bpf/prog_lsm.rst b/Documentation/bpf/prog_lsm.rst
index ad2be02f3..92bfb64c2 100644
--- a/Documentation/bpf/prog_lsm.rst
+++ b/Documentation/bpf/prog_lsm.rst
@@ -66,21 +66,17 @@ example:

    SEC("lsm/file_mprotect")
    int BPF_PROG(mprotect_audit, struct vm_area_struct *vma,
-            unsigned long reqprot, unsigned long prot, int ret)
+            unsigned long reqprot, unsigned long prot)
    {
-       /* ret is the return value from the previous BPF program
-        * or 0 if it's the first hook.
-        */
-       if (ret != 0)
-           return ret;
-
        int is_heap;

        is_heap = (vma->vm_start >= vma->vm_mm->start_brk &&
               vma->vm_end <= vma->vm_mm->brk);

        /* Return an -EPERM or write information to the perf events buffer
-        * for auditing
+        * for auditing.
+        * Returning a non-zero value will stop the chain of
+        * LSM BPF programs attached to the same hook.
         */
        if (is_heap)
            return -EPERM;
-- 
2.50.1
