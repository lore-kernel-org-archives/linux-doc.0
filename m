Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C0049502A
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 08:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398650; cv=none; b=kMZs0VjW4M/g33/l3zTvGZEv/fhX1PDiL8tibkszksg5jR76sgNIOSKAMEgwAKF2fiekKNigJAagbNb+4+lEKmvLqiUs4lW2kgFMGKXfiHHLPYLy6yAeNdG3HijX2OPedU63q4lYInVKKCek+4h5pgISwi0AvJiARzBY7PLZEJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398650; c=relaxed/simple;
	bh=KV4NCgvnjfuJ9SnmsZcbiB5ChWZrb91bGyLATNwe2BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jn37UA4dKCLNgWg5efzA92Ildi/x2rGoY+oiKf2xhZgsxrsXVeP9Ugu5JDeBoD3QbvYRW7ZFFWvzbE3jf1mS6ADjPsS9yQFy96hlFNvEcqr1BUbmciRSd8/pk52AW4XnOCNnQxJ9zTYw0zf2dAMPV6nFTESvvINh59yDge3QKOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WgPcYcgf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FOIGdnD+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WgPcYcgf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FOIGdnD+"
Date: Mon, 19 Oct 2026 10:30:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792398643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zydETQIvrkEDQKEvelBwuduBB+0DopF3zaWKJlU94C0=;
	b=WgPcYcgfAUeXq2ZT0rwNlYHw7ul3PYhc38JU83svysV6KjYagnEPebmqqeANyc+UM4+zFv
	UlrKmZ2TJLG11IxU8+b9BL269qElpfFgRJU5ykDjmbSS/JxBvFZ7dcJC45uFk+i/IxfHMh
	ejCU/sI4srbiXA60ngCE/hT+k1UrGeMsqbXwRxcf1zcw2AglX1EAhIMdkLo421hzIrTikT
	RLeqm8Bdby+Jc1lV3l0Y0LBn56ru5zkZZHsCsq8RJEFjw6FmGTPEQL4miN7yvIak3QpoF/
	9dZYeeQHyFPTTTGtdLZyOAeU7FfJF5JhuYK3W3ZuZ2cJD7Wp9/Te7C2cTXykBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792398643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zydETQIvrkEDQKEvelBwuduBB+0DopF3zaWKJlU94C0=;
	b=FOIGdnD+Hk5EO4/0LtHjtRs0K5+SulWK4nS1LrrvFqOrygzNqKr3f5jzsIYt8cqmdb74ig
	dDElMyaY6WuHmzDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-doc@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>
Subject: [PATCH v2] Documentation/printk-formats: Remove notes about %pK
Message-ID: <20261019083040.Fgpb8Jz8@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The %pK is slowly vanishing from drivers. The %p already prints hashed
output unless overridden at bootime. It is not obvious for the user which
output is using %pK and which does not.

Some people pointed out that this documentation encourages people to use
it so here is the removal. I also update the translation since the block
looks the same.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

I intend to send the admin-guide/sysctl/kernel.rst bits with the removal
=66rom vsnprintf itself. I am down to 5 drivers (as of next-20261014).
If you think that this documentation should remain as long as the
interface is available then I can postpone this.

v1=E2=80=A6v2: https://lore.kernel.org/all/20261015133553.kGn_nU-F@linutron=
ix.de/
  - Don't remove the whole %p paragraph for the zh_CN translation.
    Noticed by Andy Shevchenko.

 Documentation/core-api/printk-formats.rst     | 20 -------------------
 .../zh_CN/core-api/printk-formats.rst         | 15 --------------
 2 files changed, 35 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core=
-api/printk-formats.rst
index 57e887ff24bc8..9c188d135cc6f 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -89,10 +89,6 @@ more information for debugging, use %p and boot the kern=
el with the
 addresses unmodified. If you *really* always want the unmodified address, =
see
 %px below.
=20
-If (and only if) you are printing addresses as a content of a virtual file=
 in
-e.g. procfs or sysfs (using e.g. seq_printf(), not printk()) read by a
-userspace process, use the %pK modifier described below instead of %p or %=
px.
-
 Error Pointers
 --------------
=20
@@ -152,22 +148,6 @@ results in printing a string. For direct use in regula=
r vsnprintf() the (k)
 and (u) annotation is ignored, however, when used out of BPF's bpf_trace_p=
rintk(),
 for example, it reads the memory it is pointing to without faulting.
=20
-Kernel Pointers
----------------
-
-::
-
-	%pK	01234567 or 0123456789abcdef
-
-For printing kernel pointers which should be hidden from unprivileged
-users. The behaviour of %pK depends on the kptr_restrict sysctl - see
-Documentation/admin-guide/sysctl/kernel.rst for more details.
-
-This modifier is *only* intended when producing content of a file read by
-userspace from e.g. procfs or sysfs, not for dmesg. Please refer to the
-section about %p above for discussion about how to manage hashing pointers
-in printk().
-
 Unmodified Addresses
 --------------------
=20
diff --git a/Documentation/translations/zh_CN/core-api/printk-formats.rst b=
/Documentation/translations/zh_CN/core-api/printk-formats.rst
index 96a917ecc93f2..5922c8ef9b299 100644
--- a/Documentation/translations/zh_CN/core-api/printk-formats.rst
+++ b/Documentation/translations/zh_CN/core-api/printk-formats.rst
@@ -92,11 +92,6 @@ =E5=B8=8C=E5=9C=B0=E5=9D=80=E3=80=82=E5=A6=82=E6=9E=9C=
=E4=B8=8D=E5=8F=AF=E8=83=BD=EF=BC=8C=E8=80=8C=E4=B8=94=E6=89=93=E5=8D=B0=E5=
=9C=B0=E5=9D=80=E7=9A=84=E7=9B=AE=E7=9A=84=E6=98=AF=E4=B8=BA=E8=B0=83=E8=AF=
=95=E6=8F=90=E4=BE=9B=E6=9B=B4
 =E7=94=A8 ``no_hash_pointers`` =E5=8F=82=E6=95=B0=E5=90=AF=E5=8A=A8=E5=86=
=85=E6=A0=B8=EF=BC=8C=E8=BF=99=E5=B0=86=E6=89=93=E5=8D=B0=E6=89=80=E6=9C=89=
=E6=9C=AA=E4=BF=AE=E6=94=B9=E7=9A=84%p=E5=9C=B0=E5=9D=80=E3=80=82=E5=A6=82=
=E6=9E=9C=E4=BD=A0 *=E7=9C=9F=E7=9A=84* =E6=83=B3=E7=9F=A5
 =E9=81=93=E6=9C=AA=E4=BF=AE=E6=94=B9=E7=9A=84=E5=9C=B0=E5=9D=80=EF=BC=8C=
=E8=AF=B7=E7=9C=8B=E4=B8=8B=E9=9D=A2=E7=9A=84%px=E3=80=82
=20
-=E5=A6=82=E6=9E=9C=EF=BC=88=E4=B9=9F=E5=8F=AA=E6=9C=89=E5=9C=A8=EF=BC=89=
=E4=BD=A0=E5=B0=86=E5=9C=B0=E5=9D=80=E4=BD=9C=E4=B8=BA=E8=99=9A=E6=8B=9F=E6=
=96=87=E4=BB=B6=E7=9A=84=E5=86=85=E5=AE=B9=E6=89=93=E5=8D=B0=E5=87=BA=E6=9D=
=A5=EF=BC=8C=E4=BE=8B=E5=A6=82=E5=9C=A8procfs=E6=88=96sysfs=E4=B8=AD=EF=BC=
=88=E4=BD=BF=E7=94=A8
-seq_printf()=EF=BC=8C=E8=80=8C=E4=B8=8D=E6=98=AFprintk()=EF=BC=89=E7=94=B1=
=E7=94=A8=E6=88=B7=E7=A9=BA=E9=97=B4=E8=BF=9B=E7=A8=8B=E8=AF=BB=E5=8F=96=EF=
=BC=8C=E4=BD=BF=E7=94=A8=E4=B8=8B=E9=9D=A2=E6=8F=8F=E8=BF=B0=E7=9A=84%pK=E4=
=BF=AE=E9=A5=B0=E7=AC=A6=EF=BC=8C=E4=B8=8D
-=E8=A6=81=E7=94=A8%p=E6=88=96%px=E3=80=82
-
-
 =E9=94=99=E8=AF=AF=E6=8C=87=E9=92=88
 --------
=20
@@ -148,16 +143,6 @@ =E6=9D=A5=E8=87=AABPF / tracing=E8=BF=BD=E8=B8=AA=E7=
=9A=84=E6=8E=A2=E6=9F=A5=E6=8C=87=E9=92=88
 =E5=AE=9A=E7=AC=A6=E7=9A=84=E7=BB=93=E6=9E=9C=E6=98=AF=E6=89=93=E5=8D=B0=
=E4=B8=80=E4=B8=AA=E5=AD=97=E7=AC=A6=E4=B8=B2=E3=80=82=E5=AF=B9=E4=BA=8E=E7=
=9B=B4=E6=8E=A5=E5=9C=A8=E5=B8=B8=E8=A7=84=E7=9A=84vsnprintf()=E4=B8=AD=E4=
=BD=BF=E7=94=A8=E6=97=B6=EF=BC=8C(k)=E5=92=8C(u)=E6=B3=A8=E9=87=8A=E8=A2=AB=
=E5=BF=BD=E7=95=A5=EF=BC=8C=E4=BD=86=E6=98=AF=EF=BC=8C=E5=BD=93
 =E5=9C=A8BPF=E7=9A=84bpf_trace_printk()=E4=B9=8B=E5=A4=96=E4=BD=BF=E7=94=
=A8=E6=97=B6=EF=BC=8C=E5=AE=83=E4=BC=9A=E8=AF=BB=E5=8F=96=E5=AE=83=E6=89=80=
=E6=8C=87=E5=90=91=E7=9A=84=E5=86=85=E5=AD=98=EF=BC=8C=E4=B8=8D=E4=BC=9A=E5=
=87=BA=E7=8E=B0=E9=94=99=E8=AF=AF=E3=80=82
=20
-=E5=86=85=E6=A0=B8=E6=8C=87=E9=92=88
---------
-
-::
-
-	%pK	01234567 or 0123456789abcdef
-
-=E7=94=A8=E4=BA=8E=E6=89=93=E5=8D=B0=E5=BA=94=E8=AF=A5=E5=AF=B9=E9=9D=9E=
=E7=89=B9=E6=9D=83=E7=94=A8=E6=88=B7=E9=9A=90=E8=97=8F=E7=9A=84=E5=86=85=E6=
=A0=B8=E6=8C=87=E9=92=88=E3=80=82%pK=E7=9A=84=E8=A1=8C=E4=B8=BA=E5=8F=96=E5=
=86=B3=E4=BA=8Ekptr_restrict sysctl=E2=80=94=E2=80=94=E8=AF=A6=E8=A7=81
-Documentation/admin-guide/sysctl/kernel.rst=E3=80=82
-
 =E6=9C=AA=E7=BB=8F=E4=BF=AE=E6=94=B9=E7=9A=84=E5=9C=B0=E5=9D=80
 --------------
=20
--=20
2.55.0

