Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793057158;
	b=XsIIWbL3vW+I/Imo158gmor/IHtuwcHclEj3ptNsxlLh4iFKiEjh17/8ciCpcAMi2kPz
	 8C6trrLgDrBq1aWyYRoN/WTfhwR/2n/S6I9gYKfThFarS/ZF6pqtjZHPaF8y0d1NR4WTT
	 6Gzp7gIA3DY/iqkY/FQAG38ZRM2Q0AFzNLWaCHRyrFGQhKgj3cIpQ7ZF/8rxPmmTFJqy2
	 0pzbdfZGLJn5I05vXoo2TfUCz8gLEXgQVwXYCPQnI5zOTcNiig+FX7NHDBpDPx2/RfMSN
	 UFX+AIVajtLlt3WmnnqH1B6G9yND+GWwHMgTTXA8p/qia5QeDpFSs3XpPKRvPnaXGEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793057158;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Q0pu8Ss8TrSLj8FO7fPlBZkaV3M1b2y5HjOs69Tagg4=;
	b=0n1B/B90mX8BX+KOIccTMupFEIbgR7wLTDubFUSk8hFAQGq6PzpeO66vR22NyRyEGSWk
	 AkP5jurWcne9iOMpS6WhIoCvJy8l4REdEycRiMOEzS5V0s4Y5subXgE8xJ+LDQKaLp/I1
	 uR7uceKK3ZuWxgWQe5KJ53CDkayiuHaHH7OGoc975MoEm3VEXfFZuXXg2IzdXuCEdKhD/
	 /S9OPM8NhqtTqJAJZJ23dXzj/OhuqV+YBqmG704srs7AxxUQKFqeT55VYFMP0sp9cxLEB
	 dKuKiFEasKPSL3nCoHucs3+tekBwvJvum4IvBZLaNlN4LtkBX8ipPkQSk53vDuR+rNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dVSKUpok;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D281606A326
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 23:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dVSKUpok
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 418561F031E6;
	Mon, 26 Oct 2026 23:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793057157;
	bh=Q0pu8Ss8TrSLj8FO7fPlBZkaV3M1b2y5HjOs69Tagg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dVSKUpokpjZ2lKz5sgu2+jgvyzGaSAX6vRYnlBpqKjvv2mqyYXaKpBuR9ymf5d4t8
	 tq9iBj4ML9mzo4NKpDlpawTt+NR7UDyy+Nryj6tREZ7yArc/rpBOpz/A4/5br4zG0+
	 x0iZdj2f5Sb5mwmph2bcuRITXMEesZE9h+BBFF/4Ov3fZwvoF7ayNIbuWmfsW/EaFa
	 uCYZV36D8wg+9VF8I0AsLF+HgmaGBIG64Mybgex/7/uAKQwJJFOb3g+Ha1dY3JZJU3
	 cv+TTihPxIhbLZRaqQuPTWl+/FxkHdQBqxm5KMmqpUXuBfJWoDm+8MDdv9iWk9VtNB
	 vWJGYSqa3KOOw==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.ams.internal (Postfix) with ESMTP id 777D9198003A;
	Mon, 26 Oct 2026 19:25:50 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 26 Oct 2026 19:25:54 -0400
X-ME-Sender: <xms:feHfanZpZUzt37xIKFMuhKYUFAtgK8yWR3GHHYBN4crIzFUmPStkLg>
    <xme:feHfaqGlVMcnpDgJwDaPOrhkpPz-l7KLsejCHugjrfQNWs-YOMd1UNJGC3J8HMdhb
    XxwLAGBAeAYEZz9m5T6y4uz95UExrZAV9TlK9SXo7Sfx6kNBTl0qwJ0rw>
X-ME-Received: <xmr:feHfalA5lzAkAy0z_s4afQXpTiAjCdmMnVzhaz0p1_wzq0YiYLTZcm-gG40>
X-ME-Proxy-Cause: dmFkZTFRlyYFTVCU8gz2uLLoT2C5lHvwgmu12wMMEQ6YxiRDppxkDVz3lGvq6FPF9nVzQk
    SFaEBrDBm1p0HD3mb1az3KLUorngiBeBcGFQN9J0rx7wJvoCKxUijbnqaYFl15corEhTQ3
    PtbN5UIO7QLz7cypEQ8KcC2DzjGrV9Kt9rYgVrf9N4HJAQWkm8mmBm9ly2gH8NcVzKWb12
    dY2VvASWoZK+uTeLH2UyJQt1P3Hsxk6Rmsloqw7ul0jaPTfpquQD0WRZHE9UeHHD+0psFm
    YzE1oihGTq+GRZjvnCp6GuUBvQ9PVGybvVXIYcMJEViW6EseE1H2NDWp8egeDxaoUcaxLZ
    SSSoIStv9q2nnST4FJGE2BV02RK9Mhkpe7p+aVCmZvN7WfopAV9qpW/cKGTYxBR3CwdGWI
    TNjIcQbidM4621IEdTS3q111CDkxnz60VIpI3FChrbNu3d9zbDhf0LIE2iY2ejz8kQnCDC
    QL9Q3UBqwbVUOn/4huG7cF/Z/XCSZgWxN3N7B+TmGSgnLVdpuMehA9FZzTPavrZCspYWvl
    vPboJw8C0/8RbgeUatl8cUmLEQTyYeHySn5wVJjJP5PUs2i0Jnf2FmFHiajzSQ/3Xdf+06
    CRN3+1TBQULPtrqMtYKPJ/rmbhFwk5F7bDLJcFimdhxy1Ti7vqxpOKPm/5Qw
X-ME-Proxy: <xmx:feHfarEmGn9mslsPWrk22jv1auijKERY1VJIkEeWMKixgN4FxGkirw>
    <xmx:feHfaoKcSWozlOVaBIiqZZ61MY9JFby0V3o3Tv8W-V45yKwYpmKbEw>
    <xmx:feHfavv2_vQ0rVxLyS2FbZtDsbmCX5kQvzWIKr8U5kzHZtLaIKhSSw>
    <xmx:feHfaloD4SLm4alh9hDWWN68BxlT5hOWB_-adeAqEbrckPhYCyPUdw>
    <xmx:fuHfajUgFsFx_vLn6zIxQC_SLrFj7GMClday7_qablEEOnO_uCuY1ALk>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Oct 2026 19:25:47 -0400 (EDT)
Date: Mon, 26 Oct 2026 23:25:46 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, Matthew Wilcox <willy@infradead.org>, 
	Usama Arif <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>, 
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCHv7 13/18] mm: Drop fake head checks
Message-ID: <at_f43oDv73y-t7O@thinkstation>
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-14-kas@kernel.org>
 <ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org>
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
In-Reply-To: <ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org>

On Mon, Oct 26, 2026 at 06:45:48PM +0100, David Hildenbrand (Arm) wrote:
> On 2/27/26 20:42, Kiryl Shutsemau (Meta) wrote:
> > From: Kiryl Shutsemau <kas@kernel.org>
> > 
> > With fake head pages eliminated in the previous commit, remove the
> > supporting infrastructure:
> > 
> >   - page_fixed_fake_head(): no longer needed to detect fake heads;
> >   - page_is_fake_head(): no longer needed;
> >   - page_count_writable(): no longer needed for RCU protection;
> >   - RCU read_lock in page_ref_add_unless(): no longer needed;
> 
> I have an AI report that removing RCU read-lock was wrong.

Ughh. Yes, it is a real bug.

My reasoning in the commit message was wrong. Nothing stops a
speculative get from writing to one after the remap. On x86 even a
failing cmpxchg faults there.

The fix I have in mind is to let the atomic fault.

If the update faults, the struct page is a read-only HVO tail with a
zero refcount, so the get just fails. An exception table entry on the
cmpxchg handles it. No RCU on either side, and the fast path stays the
same lock cmpxchg loop.

Only x86, riscv and loongarch have HVO. Below is x86 only, to show the
idea; riscv and loongarch need the same primitive in their LL/SC
fetch_add_unless().

Lightly tested on x86 by hitting a real HVO tail page.

Does it look sane?

I can prepare a proper patchset if looks reasonable.

diff --git a/arch/x86/include/asm/atomic.h b/arch/x86/include/asm/atomic.h
index 75743f1dfd4e..5252b1382ed0 100644
--- a/arch/x86/include/asm/atomic.h
+++ b/arch/x86/include/asm/atomic.h
@@ -108,6 +108,25 @@ static __always_inline bool arch_atomic_try_cmpxchg(atomic_t *v, int *old, int n
 }
 #define arch_atomic_try_cmpxchg arch_atomic_try_cmpxchg
 
+/*
+ * arch_atomic_fetch_add_unless_nofault() is arch_atomic_fetch_add_unless(),
+ * except that a fault on the access jumps to @label instead of oopsing.  It
+ * works in any context, including with IRQs disabled.
+ */
+#define arch_atomic_fetch_add_unless_nofault(_v, _a, _u, label)	\
+({									\
+	atomic_t *__v = (_v);						\
+	int __a = (_a), __u = (_u);					\
+	int __c = arch_atomic_read(__v);				\
+									\
+	do {								\
+		if (unlikely(__c == __u))				\
+			break;						\
+	} while (!__try_cmpxchg_nofault(&__v->counter, &__c,		\
+					__c + __a, label));		\
+	__c;								\
+})
+
 static __always_inline int arch_atomic_xchg(atomic_t *v, int new)
 {
 	return arch_xchg(&v->counter, new);
diff --git a/arch/x86/include/asm/cmpxchg.h b/arch/x86/include/asm/cmpxchg.h
index a88b06f1c35e..685aab3edd3f 100644
--- a/arch/x86/include/asm/cmpxchg.h
+++ b/arch/x86/include/asm/cmpxchg.h
@@ -232,6 +232,63 @@ extern void __add_wrong_size(void)
 #define arch_try_cmpxchg_local(ptr, pold, new)				\
 	__try_cmpxchg_local((ptr), (pold), (new), sizeof(*(ptr)))
 
+/*
+ * __try_cmpxchg_nofault() is arch_try_cmpxchg() on a 4-byte kernel variable,
+ * except that a fault on the access jumps to @label instead of oopsing.
+ */
+#ifdef CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT
+#define __try_cmpxchg_nofault(_ptr, _pold, _new, label)		\
+({									\
+	bool success;							\
+	__typeof__(_ptr) _old = (__typeof__(_ptr))(_pold);		\
+	__typeof__(*(_ptr)) __old = *_old;				\
+	__typeof__(*(_ptr)) __new = (_new);				\
+									\
+	if (sizeof(*(_ptr)) != 4)					\
+		__cmpxchg_wrong_size();					\
+	asm_goto_output("\n"						\
+			"1: " LOCK_PREFIX "cmpxchgl %[new], %[ptr]\n"	\
+			_ASM_EXTABLE(1b, %l[label])			\
+			: "=@ccz" (success),				\
+			  [ptr] "+m" (*(_ptr)),				\
+			  [old] "+a" (__old)				\
+			: [new] "r" (__new)				\
+			: "memory"					\
+			: label);					\
+	if (unlikely(!success))						\
+		*_old = __old;						\
+	likely(success);						\
+})
+#else
+#define __try_cmpxchg_nofault(_ptr, _pold, _new, label)		\
+({									\
+	int __err = 0;							\
+	bool success;							\
+	__typeof__(_ptr) _old = (__typeof__(_ptr))(_pold);		\
+	__typeof__(*(_ptr)) __old = *_old;				\
+	__typeof__(*(_ptr)) __new = (_new);				\
+									\
+	if (sizeof(*(_ptr)) != 4)					\
+		__cmpxchg_wrong_size();					\
+	asm volatile("\n"						\
+		     "1: " LOCK_PREFIX "cmpxchgl %[new], %[ptr]\n"	\
+		     "2:\n"						\
+		     _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_EFAULT_REG,	\
+					   %[errout])			\
+		     : "=@ccz" (success),				\
+		       [errout] "+r" (__err),				\
+		       [ptr] "+m" (*(_ptr)),				\
+		       [old] "+a" (__old)				\
+		     : [new] "r" (__new)				\
+		     : "memory");					\
+	if (unlikely(__err))						\
+		goto label;						\
+	if (unlikely(!success))						\
+		*_old = __old;						\
+	likely(success);						\
+})
+#endif
+
 /*
  * xadd() adds "inc" to "*ptr" and atomically returns the previous
  * value of "*ptr".
diff --git a/include/linux/page_ref.h b/include/linux/page_ref.h
index 9f5c75d06f76..82a2fc445ce6 100644
--- a/include/linux/page_ref.h
+++ b/include/linux/page_ref.h
@@ -246,9 +246,31 @@ static inline int folio_ref_dec_return(struct folio *folio)
 	return page_ref_dec_return(&folio->page);
 }
 
+#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+/*
+ * HVO maps the tail struct pages of a hugetlb folio read-only.  A speculative
+ * caller can read a non-zero refcount, then the page gets freed, becomes a
+ * tail page of a hugetlb folio and is remapped before the update.  The
+ * atomic then faults.  A read-only struct page is a hugetlb tail page with a
+ * zero refcount, so the fault means no reference can be taken.
+ */
+static __always_inline bool __page_ref_add_unless_zero(atomic_t *v, int nr)
+{
+	instrument_atomic_read_write(v, sizeof(*v));
+	return arch_atomic_fetch_add_unless_nofault(v, nr, 0, fault) != 0;
+fault:
+	return false;
+}
+#else
+static __always_inline bool __page_ref_add_unless_zero(atomic_t *v, int nr)
+{
+	return atomic_add_unless(v, nr, 0);
+}
+#endif
+
 static inline bool page_ref_add_unless_zero(struct page *page, int nr)
 {
-	bool ret = atomic_add_unless(&page->_refcount, nr, 0);
+	bool ret = __page_ref_add_unless_zero(&page->_refcount, nr);
 
 	if (page_ref_tracepoint_active(page_ref_mod_unless))
 		__page_ref_mod_unless(page, nr, ret);
-- 
  Kiryl Shutsemau / Kirill A. Shutemov
