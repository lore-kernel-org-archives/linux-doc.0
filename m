Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEB1168BD
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 07:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="b+BSOUSU"
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E8A185;
	Wed, 25 Oct 2023 00:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oJ5H5HuNeUS44YCodtmW5YmlPErriupXrPKUq6nl7ds=; b=b+BSOUSUQZ5rSGSPcCKM8aHQzz
	mgUmSZOyVtiTAQ6g6Vo0bJpvEV1Ybl3fTSfU/lwrBibTCBcGsWdDUyPHzGfdYi4Hgo1FQYs01XPJN
	eCJZ5/cBBQRNAVLz/uAPJHn0NKXaLdyBaaw0Jufj6txzi+dD2HaoDqnRgMMz2a8KjO6W1k37RfWZW
	WbKhNqdZiB/448MUC7WbrFkBLFHj4oBll1nDDgiVFZexO+HdVa/igEoHvMOE0sNz37Sh6gTjF9b5Y
	QgNsACZWTW/stWlCMJpowpKI4TJGieizTwEbnwxrbfzDVhHXSbNXGSNAqTU6B99RxkmUmtgg1V39l
	9K0hqNcw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qvYEC-00GBPR-0G;
	Wed, 25 Oct 2023 07:22:56 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B84DC30047C; Wed, 25 Oct 2023 09:22:55 +0200 (CEST)
Date: Wed, 25 Oct 2023 09:22:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Andy Lutomirski <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, tony.luck@intel.com,
	ak@linux.intel.com, tim.c.chen@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	Alyssa Milburn <alyssa.milburn@linux.intel.com>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	antonio.gomez.iglesias@linux.intel.com,
	Alyssa Milburn <alyssa.milburn@intel.com>
Subject: Re: [RESEND][PATCH 1/6] x86/bugs: Add asm helpers for executing VERW
Message-ID: <20231025072255.GA37471@noisy.programming.kicks-ass.net>
References: <20231020-delay-verw-v1-0-cff54096326d@linux.intel.com>
 <20231020-delay-verw-v1-1-cff54096326d@linux.intel.com>
 <f620c7d4-6345-4ad0-8a45-c8089e3c34df@citrix.com>
 <20231025062818.7kaerqklaut7dg5r@desk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025062818.7kaerqklaut7dg5r@desk>

On Tue, Oct 24, 2023 at 11:28:18PM -0700, Pawan Gupta wrote:

> With .text.entry section I am getting getting below warnings and an
> error:
> 
> -----------------------------------------------------------------
>     LD      vmlinux.o
>   vmlinux.o: warning: objtool: .text.entry+0x0: unreachable instruction
>   vmlinux.o: warning: objtool: .text.entry+0x40: unreachable instruction
>   vmlinux.o: warning: objtool: .text.entry+0x80: unreachable instruction
>   vmlinux.o: warning: objtool: .text.entry+0xc0: unreachable instruction
>   vmlinux.o: warning: objtool: .text.entry+0x100: unreachable instruction
>   vmlinux.o: warning: objtool: .text.entry+0x140: unreachable instruction
>   vmlinux.o: warning: objtool: .text.entry+0x180: unreachable instruction
>   vmlinux.o: warning: objtool: .text.entry+0x1c0: unreachable instruction
>   vmlinux.o: warning: objtool: .text.entry+0x200: unreachable instruction
>   vmlinux.o: warning: objtool: .text.entry+0x240: unreachable instruction
>   vmlinux.o: warning: objtool: .text.entry+0x280: unreachable instruction
>   vmlinux.o: warning: objtool: .text.entry+0x2c0: unreachable instruction
>   vmlinux.o: warning: objtool: .text.entry+0x300: unreachable instruction
>   vmlinux.o: warning: objtool: .altinstr_replacement+0x2c: relocation to !ENDBR: .text.entry+0x0
>   vmlinux.o: warning: objtool: .altinstr_replacement+0x1c4: relocation to !ENDBR: .text.entry+0x0
>   vmlinux.o: warning: objtool: .altinstr_replacement+0x1d0: relocation to !ENDBR: .text.entry+0x0
>   vmlinux.o: warning: objtool: .altinstr_replacement+0x2d2: relocation to !ENDBR: .text.entry+0x80
>   vmlinux.o: warning: objtool: .altinstr_replacement+0x5d5: relocation to !ENDBR: .text.entry+0xc0
>     OBJCOPY modules.builtin.modinfo
>     GEN     modules.builtin
>     MODPOST vmlinux.symvers
>     UPD     include/generated/utsversion.h
>     CC      init/version-timestamp.o
>     LD      .tmp_vmlinux.kallsyms1
>   ld: error: unplaced orphan section `.text.entry' from `vmlinux.o'
>   make[2]: *** [scripts/Makefile.vmlinux:36: vmlinux] Error 1
> -----------------------------------------------------------------
> 
> ... because my config has CONFIG_LD_ORPHAN_WARN_LEVEL="error" and
> objtool needs to be told about this entry.
> 
> Do you think its worth fighting these warnings and error, or simply use
> .rodata section for verw memory operand?

I'm thinking you need to at the very least stay in a section that's
actually still mapped with PTI :-)

.entry.text is the only thing that is reliably mapped with PTI (IIRC),
some configs also get a chunk of the kernel image, but not all.

Something like the below should do I suppose.

---
 arch/x86/entry/entry.S | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/x86/entry/entry.S b/arch/x86/entry/entry.S
index bfb7bcb362bc..9eb2b532c92a 100644
--- a/arch/x86/entry/entry.S
+++ b/arch/x86/entry/entry.S
@@ -6,6 +6,8 @@
 #include <linux/linkage.h>
 #include <asm/export.h>
 #include <asm/msr-index.h>
+#include <asm/unwind_hints.h>
+#include <asm/segment.h>
 
 .pushsection .noinstr.text, "ax"
 
@@ -20,3 +22,16 @@ SYM_FUNC_END(entry_ibpb)
 EXPORT_SYMBOL_GPL(entry_ibpb);
 
 .popsection
+
+.pushsection .entry.text, "ax"
+
+.align 64
+SYM_CODE_START_NOALIGN(mds_verw_sel)
+	UNWIND_HINT_UNDEFINED
+	ANNOTATE_NOENDBR
+1:
+	.word __KERNEL_DS
+	.skip 64 - (. - 1b), 0xcc
+SYM_CODE_END(mds_verw_sel);
+
+.popsection
