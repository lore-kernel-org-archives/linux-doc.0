Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADA7334C1F
	for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 04:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783829333; cv=none; b=V5fK1vAxigEFZ42bI7E3BWWu45Ja3xwzaGMI22FdGrzVnwn7FSMnXvD2BfGO4hhxy9qt9FWR6LsjrIxdbinrJpAxo0yDuHCpg6z6b6kct1ULcY8WUKoxL3uzI2XHAgd/uaAeOfmUD8OTaEqOo/IsIMBeCtsDND28vVLWdcCVHJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783829333; c=relaxed/simple;
	bh=1q6mbB/bkD8j4HZw6McdfhEuY8vqwQWBAE158sj4Y8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TFu3nZsw9ncoOOmUI3rqTTHaJpCfNu3liwNCwBM42qRDVlVxpcuU6IGMWukvctNbHyUts+KVPY7SJnOruHf8sAol9q8tXtXs6MmuUV0SdTXN0nU0qh9apo4zb9cdpfz2i0xyk/GuDU25Wr81/Ttq2rJtzAk9/xlkRjhnu59OrnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbokcfpl; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbokcfpl"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-383cb94f742so1807012a91.3
        for <linux-doc@vger.kernel.org>; Sat, 11 Jul 2026 21:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783829332; x=1784434132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1vSs3PpxD7fzzGCyEVeEQofuGfZwATqltGOSkAKOV+Y=;
        b=cbokcfpllFKwZICTa8uyEtG3gK/7FawCR3BdoMCN2eYnV/UaEACwX8YYUUTY937kqu
         XrhvbfA812Px1NShMdXdMLykuPbxRC5P+2PoPv3ARp/vRKOFfCsUPO71qaLla4K85qfO
         ztngsdEEwdwI/6rv+0V2rsNJiSerwBjniugxklJfOUOAXlFU04Zch8ec5bzDlUImavL3
         Id7FFDrNo72KepusQwMZi7n2BOfd/7MWmiPrCIH09//1ijwcKdTqEj093c8nw4Rw8EKl
         zjzAQu36pZUYE9gZQ+3xDntkT/jY0pnlf+I4CD2rhkkarpitFXpDnOZcUQt1p+r15IRj
         wyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783829332; x=1784434132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vSs3PpxD7fzzGCyEVeEQofuGfZwATqltGOSkAKOV+Y=;
        b=spOQQ7aqO9LZV7e5mBkcnSvY7RAh3V9T+aEowVQSeVQrPdmos1oOrbcs3XhJmsnpJT
         xWfuO//0DMEo+3vj1utmsO4g7uf72VPMV8Sh6OVAy4uyZVVMVERaKmCyPjFaOoHQEzWc
         kbv5lJMR/Cqpr3toEOIgHjtnoudu6ylNx3juzPOQLvsHJu9UvkaaQszhnl1JQKCLoK2g
         v1X56ugTYQ9w1dJISzzunIC5zu9COwW4vwu/WS0crzH0lmAUEEHH4VL7D6hVVK0iXyvn
         jGdTC/iStc4zlFDZTULt9C6hgj29x7sLwrB9Fcroga41R1duXdhVtTIXdAFTCetVtcA2
         LOsg==
X-Forwarded-Encrypted: i=1; AHgh+RrUMykaFtgsVQbfCIu2ll3FIQ+JBxueZRGwf1AQG/Md2OAC8PSODlGzz3/DZPoyIAOIl21MJxqFmuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbSGCgZjkop3lyaxA21REfRXwK/d7ofefPL/MS770ND6GYNhGM
	8SstfZ1PY+KXZpJyjZrT7PV0rRCFDwNH5B31lgUEzwPDODKnAFiz5S5U
X-Gm-Gg: AfdE7clpF+/rCyL/S/bKU4vAl732XbmmPRaIaUvuK+ItRQF//liufA7bOFz7751JvA+
	+/Fln4KPDwujU1FG3L1OriqeRCHOVEOqg39jRXQ30G///J/ANKIsq4gAy4wRGrKZLZzVUTrLkPp
	ZcJMglV3M0RcrJhrxlAHxZ+GQb+uPcxyMC7QYhXN1Pvcy93KEk+EiNMJkkeUVRZbsr6zcC+tQjS
	LJM+xmu8S7AAe/LD2df8vW3kcBkzxrX5SIof+pNl8Y8RDkr4TPN6aGVC4nBtnHts3t7289zz6WZ
	0LUN2Ir3P5x039wJFujHUgFYc9E7XxBIYgwVuBim6xcR7pmvtgW/gPS8VD3nQ38uNUDvdOaW8WI
	zcXg1udiDHHLCb731tS5yVeP82LsKgIJIfsTf99uta45xksazQPPPx1ZcoPjylKt1nA3TamWUmX
	F33hUGl0D09B2caSu+RZqEqxWMb3U=
X-Received: by 2002:a17:90a:e7c4:b0:38d:eaec:4396 with SMTP id 98e67ed59e1d1-38deaec5594mr631416a91.11.1783829331759;
        Sat, 11 Jul 2026 21:08:51 -0700 (PDT)
Received: from [127.0.0.2] ([98.35.8.117])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm56808928eec.10.2026.07.11.21.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 21:08:51 -0700 (PDT)
From: Farid Zakaria <farid.m.zakaria@gmail.com>
Date: Sat, 11 Jul 2026 21:08:14 -0700
Subject: [PATCH v2 1/5] exec: stash a bpf-selected interpreter in struct
 linux_binprm
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-binfmt-misc-bpf-v2-v2-1-d6591ceaf207@gmail.com>
References: <20260711-binfmt-misc-bpf-v2-v2-0-d6591ceaf207@gmail.com>
In-Reply-To: <20260711-binfmt-misc-bpf-v2-v2-0-d6591ceaf207@gmail.com>
To: Christian Brauner <brauner@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: Andrii Nakryiko <andrii@kernel.org>, Kees Cook <kees@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Jonathan Corbet <corbet@lwn.net>, Jann Horn <jannh@google.com>, 
 John Ericson <mail@johnericson.me>, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Farid Zakaria <farid.m.zakaria@gmail.com>
X-Mailer: b4 0.14.3

From: Christian Brauner <brauner@kernel.org>

The upcoming bpf-backed binfmt_misc handlers select the interpreter for
a binary programmatically at exec time. The selection runs before
load_misc_binary() has copied the binary path from bprm->interp into
the argument vector, so the selecting program cannot go through
bprm_change_interp() directly without clobbering argv[1].

Stage the selected path in the bprm instead. The bprm is exclusively
owned by the task doing the exec so no synchronization is needed. The
consumer frees and clears the field once the exec attempt that set it
is finished; free_bprm() covers all error paths.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/exec.c               | 1 +
 include/linux/binfmts.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/fs/exec.c b/fs/exec.c
index b92fe7db1..7c9e28f54 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1418,6 +1418,7 @@ static void free_bprm(struct linux_binprm *bprm)
 	/* If a binfmt changed the interp, free it. */
 	if (bprm->interp != bprm->filename)
 		kfree(bprm->interp);
+	kfree(bprm->bpf_interp);
 	kfree(bprm->fdpath);
 	kfree(bprm);
 }
diff --git a/include/linux/binfmts.h b/include/linux/binfmts.h
index 7e7333b7b..1dbec6905 100644
--- a/include/linux/binfmts.h
+++ b/include/linux/binfmts.h
@@ -65,6 +65,7 @@ struct linux_binprm {
 				   of the time same as filename, but could be
 				   different for binfmt_{misc,script} */
 	const char *fdpath;	/* generated filename for execveat */
+	const char *bpf_interp;	/* interpreter selected by a bpf handler */
 	unsigned interp_flags;
 	int execfd;		/* File descriptor of the executable */
 	unsigned long exec;

-- 
2.51.2

