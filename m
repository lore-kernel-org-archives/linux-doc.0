Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158309;
	b=Llf3VtKpAHXYTQwpyR1cdCqXtd15aYOye3vy0FN4ud5IrsFD3z50ISrpFKR5HTCfQICN
	 AgZPXOAmLTH9j8Wp9uiige5cXQglDR0q6CgbeOrZdenYxS0y8f4WWLVY/MPn671/2uADb
	 8jGgzBtYEJnb0out6JsFk5RKKGa3TOLAlWj4fa0JKBYMmGxKPC46CBPh7fkWhtpn2s0p1
	 lI62gFusNWzgKY/y4FOD9/yE5PaikwZO3va99onNwXh8HNpC7eKFOG9V0A4wSB2VFbEV0
	 /CCmAdVN4+7ffnWxXqGtv8eK0zQVmGnQTCQEFdteRB5wGVrI9Bp7EmZhouugkKEyPEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XMTbYYVHlMzt/kOSKupfitaPTvvxuFfzu7jXp67o424=;
	b=Ci4aSs7fDmc0jOjTCC3DDwn0dkmvKmt3BIJCnLq+D5ZRpqYSm9U5/M+eCIEJkcC6SCNH
	 1otyZOetRzHMUgmlx6oDvM8bfKy7R0EgxItsjZbBuKi9JfdGYB59oOgM6wEjC8oWtVuvQ
	 C9jzERV8RNyenKVF/tr5oX//4XlpPmmwFYVNRmDONmN3cd5WvWqg95NKd44I7LoTPrO8W
	 eDtWrQ2P/fsEa8uSY2NvlLoK8Rs21J/R5cvzAe2vV+7a53ANvsE7Sly7nYA0CSDME+9Sh
	 KNU2+BxTD9NjcM9Q0I6JNOqXYLCB4JJmAg9PjhBo6blTBfNkTWziXk+zM6MhhM56bzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xBKeCNf5;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E62606A322
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 03:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E62606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xBKeCNf5
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e4831c028so410847f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 20:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158307; x=1793763107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XMTbYYVHlMzt/kOSKupfitaPTvvxuFfzu7jXp67o424=;
        b=xBKeCNf5ITTDcklqB6jjif7vTfdV2S6+gqmE3n+nD6xcvqqK/ms1k46RxlvyqTFTPR
         tg0Ok2ZPztpGofsrbFwqltnbRcBObY0jQ2oT7bcsJihnVn0retaP6WmYvZSnZRafJaSF
         lzyLC4cgf7vVmHVrhNe2lHXvKZCAavK4pVUVQDZuzJty1+0y8+MO92i2n+ZI9/LcRieA
         AR+uOT9Na0OlkKSbgnEB3XdRgG3YkGA1EJrtpIOmode+Ttp1Ops99NyzsrbHJ2J7oiVg
         ipm+uP9HWhXMDLxLU3Be7rLWH60b9UpOpalvYdsNG0Aj6oMjxel/K3CLNJhDAGVLQKnC
         PdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158307; x=1793763107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XMTbYYVHlMzt/kOSKupfitaPTvvxuFfzu7jXp67o424=;
        b=SF5xI9AVSMM2CpIGqdQ0y3jLb6AaXAYc7S0heNhz0RjrR3PlVnXl659mGP3mxCQn+i
         zQCjWz2uDRevbzvjRHhoVR0ZD540lNZU/rTSgMjyxp2sWDqRrL0rFbFvseLxCRg8JEfa
         LnGEhSSGFz8zpHf5k8ASFvPp154sF1PjWCD2X0vm2aRo7ofImbGjJRnrvDgw+8I06xQv
         QGfx2J1YWWXe/39Q40G1K+3a/s+76ZWZcOXryqfUyRFZTzDrh/Eg+pzKVXPlnQEyIO8Z
         VAH7p7ipRPkvB8qUpmHXSnMYaCu8svdWR/E3c9Fu0bEhwDXAI+W35sNdsLssS9aoUzpA
         xl+g==
X-Forwarded-Encrypted: i=1; AKwUvBzDgSNOJVBuO7KCpsOZW52YxS9SdR8GUjArdulKiTlRDU7nio3Z8JINvmnNX0y9USk1R8qtLvsxP18=@vger.kernel.org
X-Gm-Message-State: AFq9FYIw44sTHWCHxeGxscEVBVa89DzNfTlOzAyjQ5Jr0uRYtLcBh8hK
	yV1uqA/BNGC671UOXaGLVaSzOaGARAK9yooQqbeyI3SAkplHsYZaFPqG
X-Gm-Gg: AYBFou0ki39R8NiGiEaJpAUBWSIAlQO/OEEtJtaC8zYKgjumbuQ78/vcCjqduN7aqvo
	4QQjFNQY6ksn+zICxLC06IGLVzwK1jKMxOaCvZ1/jev/JcC7ZFuD3glfuDcAOhX+shoXwKVHv/D
	9O0Nh+znE4oVK5SmvFD7AqGK9md4+cJ5SIgZbLJCpToMIDvtPea8wQItaug7cJthIujof8LraXQ
	oxuc+XiqETU8R8myIvmmHuFWz/wqzOGdV6qKEkrGViBKT9SW19czp1eR69+1SiovHjj9Rkce8FS
	87u3Pm5Nyjh3DJ9AXWy5z0qKwZcDEwihzObstyjykcT4SzvdNI6/CYZnJNJYu+fdlKPjWKKh9wX
	0FinUD2Zisf8tJZWj/JGeiYNzRgXVSVEC7FWhP5bVAOmuuVi2I/dfUGbSLTAFLz6QEj31KYy7Nf
	PWXz1PSWJv8iCuJcaEtUr90KLMDZCsVPT2EFoRbZ3Q2gHscAsgbjtBUlMmPVR5B25vv/UVQZ7EU
	FdYhJ273PmhFLpEYfrfax0PgB5rKYxOG5Go2+zAiCmwzNZ8zyg+Tp3hTHf/WOblYaDHlXUe+GDM
	Uo0MEWizZEDKvM/XcBvCF3YJ/YAHR58P8nN5Rip+e+L0Dbsjw18+xnlP9uBGnQP6H22tJ2NEG8k
	6BBI6ypcqhq5zOLlEqYYtphVY34JYe/oA2/DGOBjasZTBr1GgiEthDW5yb/U6Awpq4HAD3bagFp
	cJYCp9o3LCxX6YklM9qZSNEdC+zXzfjUVZdUBkJfsns7hW3oNcdvCghw==
X-Received: by 2002:a5d:6f13:0:b0:48e:4e00:b737 with SMTP id ffacd0b85a97d-48e5d56d4fdmr2944765f8f.54.1793158307173;
        Tue, 27 Oct 2026 20:31:47 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.31.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:31:45 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 02/13] arm64: percpu: Annotate __kern_my_cpu_offset() as '__always_inline'
Date: Wed, 28 Oct 2026 04:31:16 +0100
Message-Id: <20261028033127.82193-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Will Deacon <will@kernel.org>

Allow the use of per-cpu variables from noinstr functions by marking
__kern_my_cpu_offset() as '__always_inline'. This will later be relied
upon to detect stack overflow of the overflow stack from noinstr C code.

Signed-off-by: Will Deacon <will@kernel.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Link: https://lore.kernel.org/r/20260918161407.2300-12-will@kernel.org
---
 arch/arm64/include/asm/percpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 3cc316091d665..105f659bf8061 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -37,7 +37,7 @@ static inline unsigned long __hyp_my_cpu_offset(void)
 		    "mrs " dst ", tpidr_el2",				\
 		       ARM64_HAS_VIRT_HOST_EXTN)
 
-static inline unsigned long __kern_my_cpu_offset(void)
+static __always_inline unsigned long __kern_my_cpu_offset(void)
 {
 	unsigned long off;
 
-- 
2.39.5 (Apple Git-154)
