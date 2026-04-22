Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A831B31F995
	for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 14:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776869295; cv=pass; b=bbPded6+NObNpkXRHybU9zpkK7Pb8hYPzHwLqjqDXlHRjxmZEJZRbQmZyQf+I5t11eB5pAZN2QSOE5Q5BFLhWfdHh7PA2aL+UPXv13LQb+xE4zEw8yf3xADDEj9cGAdtUHtj+4TmUs/46hVHm9qNv0BVpTo7Yavfuz51Np5Eqho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776869295; c=relaxed/simple;
	bh=tfnBijA/tHgHM0lSvhKY7uny8mkDHsaIhjWoI77S9Es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyDXJLO3R4Am8/IZpi2ExfGkgm2D1OnzvXJPdPHoEeFIGdBR3qPcHOlqIW3vuXT+aHam4j9HkfQfGVNjcaUxEKh+5zsDtgq0DOGMiqMPkwjGriJ65cY7epZeUCOLwGZobUSq+P7sPAuS9uQKiFH8n1V73FQaer5IKQkgTfcBC1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bb1ShRys; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bb1ShRys"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-441209fb77eso1347164f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 07:48:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776869292; cv=none;
        d=google.com; s=arc-20240605;
        b=JEFXhpRacGB3w6dU07kyLke/747k6FQ0U9t4f922/Zny/WjNQyFOqMjLObY9H4z8Fh
         giix0acoP5Sf0yidzJ9O7hIEdpGA5esIU5Dr4hJYPHtbqRoQ9kzOolXK9J1LN1z6D9f6
         gjl97LmcldtKifEF4WxYfW00SO8DB/pGcLjDh4iYCWI4mBjooTC7Kh2x54b1J3zfBUgO
         Kvxv4PFvbPjvbQN5Ks7b12yZXeaaAE/gFb8gkwqZqk6ZNXWapjvO8M7gKWOfJlQ9wTjB
         UYQcE1AADWH2wHKhCI5rx6gOfuqe0sWHa1wvaaIwXbTuL1M/wQTh6jMOgZsMnxZsjIc1
         A1KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tfnBijA/tHgHM0lSvhKY7uny8mkDHsaIhjWoI77S9Es=;
        fh=XEsqDP4ZTNLxiMs9vnpB5LmgPXJGz742wn57wq+zZck=;
        b=e2Gnz4Jo9b5nNpTjSNOArEd8BN75lehdLvvnWR3wK0y3kJcKNyTYTnW56LWWVejd3I
         1RrFyCm6JUz9zgAG8gaPSNJQJY2tCnQSJiSZDznD/KEygao02iiONkikUh67aov65uv6
         LQ0RDzNMQmfodKVJ/GecQi4Lot9G1udQ5781U+N8Zq4f6XKeVJqDLlRcRGyOCd9sl/ZJ
         etw3yfETrJSwJIooG4leGxErzZ1Q6hH679H9udMYDZcJ2JJTQ2NedXEODRmrcFLZiP73
         vSv0zw/eHDdt1kC2HwpOUbw7mSfw6TBJicUQcatoyH37f7jGFYQpm+wmWSV0Ge8j+M3R
         JujA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776869292; x=1777474092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfnBijA/tHgHM0lSvhKY7uny8mkDHsaIhjWoI77S9Es=;
        b=bb1ShRysobJfv/guBXGH2tIQfvbJBdXF37+QGzOj6A0jZcum/r49058R8xu4XpGfk1
         MaxgLaeXFrngS6o48HliqwXVOUOhfWNflD3LXRspe9YhVzxR1AcbKW9pljOMbzeL4yxO
         vLVbWAB+nKgn90E85+kPvheBuhUPnNS2oTeBazDiWElY3wOKGCBl8C/NjbA5FnVcImRO
         RoUGscdYiQR64jcqkyKdaeY0RygSVzEu1xUW5ctXCsgYcHEt1MLusjO+28jwXtpMkMs+
         mf1oIo0UcRoDwuNgfN5Wgclg+XaMwQV5gOTBhEt5DEc1WEh4YdlZQmAbiBRpK+2odnY/
         b2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776869292; x=1777474092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tfnBijA/tHgHM0lSvhKY7uny8mkDHsaIhjWoI77S9Es=;
        b=bbby4E7vYG73w5wG7nTinx3NOTvKvPdLHWRX6cqg40Ish6FopA1J+s1odqXDhISm6f
         uK08VHtA3FzskZvGKrmaYPUEesLRBG9N7e3F37i1HefC4st7gPR07mqUXmh5qTh1HWBl
         XN+OhBBhMA7Q3/FQ5AlQU1DO64R548ZXMew1SGc+PpUgy1ZYnwlCHTWWTiE1ETeVGWU9
         RdxOOAOuuc6mUSsWuNPO8VBa5da7UFw/LH60gHBnWPMfWloaoCzclKIi5GddP0VQZ1Hr
         Ppy00Xb0r75+1cJrQC7RsLjrxRzyGcqMRZ8MYS4xwzlzZM9yIzZ+sBY9eiteiMdWIyJD
         gSkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/qnIBWHYvOBpnkKLURohMJKBzzKIarewiCRiWfAGR0m9jLV59yORbFOcn01sxLVN+zFYZgVasPcOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIpH+SihMLRzYiYssujld91Pf4UN4paDidRm5DJYJkbi+vqBA6
	qReOx+dCeKIwHAXHaGxUowXPFHz27tI2W02uJuPKppX1bhAEUmLos3UAyNYEBn3Oqoe8p5HRoPN
	1j7TJi8k/F82V2EzQ0IRh61Pl9K+7Lb8=
X-Gm-Gg: AeBDietUuawhGCpS6NHU83D2yHZfTGKKZem33MkIIcvGIy1FzTrNpWaGXUydfZrGf77
	KzEJ2rLSl9xFcAUDRdH6FO0vplLShzMmCNRkYY10vmjDzm68fpD2YGkbCXi+rY4xSbhVGwEdw5X
	wJzM49wqCIRNrcuMsp0VQ3U4GaxLThp6qFhIjyN6JTSgHfnYZbM/8IwcK8Ohkbq5k/WEtzvNv+4
	MT6wBrN+7H32leaJxRsdBjCEufyrzGxxd/BjCSX7Yhpi5yJ1R80jrr57+XjgrcSMiUpl/TFL8tB
	erjXgDmSl6avyMRivRlErL0DWmDXIXJmsrlDnQ/nRlevMPElcPLEZHJpDxBhy/OM7Qjd+J1B1On
	9JHQQo1OxNIj6kX35dHnKQotFUDOAk7KLgiwu
X-Received: by 2002:a05:6000:2dc6:b0:43d:7512:6f7b with SMTP id
 ffacd0b85a97d-43fe3f35785mr36196268f8f.5.1776869291840; Wed, 22 Apr 2026
 07:48:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <acLbnMAPrHCpoIpr@laps> <20260325011853.657295-1-sashal@kernel.org>
 <c7a8310e-501f-48a8-8ad5-0a40d8b3836b@oracle.com>
In-Reply-To: <c7a8310e-501f-48a8-8ad5-0a40d8b3836b@oracle.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 22 Apr 2026 07:48:00 -0700
X-Gm-Features: AQROBzA3qHbWnHv7v7Pdc9rqcoF99lBmBFrCQdAyyZbQ78QmK7wYiCIv_i6_yA8
Message-ID: <CAADnVQKshVai_srj_X_T-1AG3QH=VHymDO7Z4JowLcbC+jjReg@mail.gmail.com>
Subject: Re: [RFC] btf: split core BTF parsing out of BPF subsystem into kernel/btf/
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Sasha Levin <sashal@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Alexey Dobriyan <adobriyan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexei Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>, bpf <bpf@vger.kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Gow <davidgow@google.com>, Helge Deller <deller@gmx.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Kees Cook <kees@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-modules@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	"Luis R. Rodriguez" <mcgrof@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Petr Mladek <pmladek@suse.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, X86 ML <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 3:44=E2=80=AFAM Alan Maguire <alan.maguire@oracle.c=
om> wrote:
>
> On 25/03/2026 01:18, Sasha Levin wrote:
> > Move BTF type format parsing and inspection code out of the BPF
> > subsystem into its own kernel/bf/ directory, separating core BTF
> > functionality from BPF-specific extensions.
> >
> > CONFIG_DEBUG_INFO_BTF currently depends on CONFIG_BPF_SYSCALL, which
> > prevents embedded, automotive, and safety-critical environments from
> > using BTF. These platforms often disable BPF for security and size
> > reasons but would benefit from BTF type information for crash
> > diagnostics and debugging.
> >
>
> I had a go at a refactor in this area too, and it's pretty tricky. How ab=
out
> we start with a smaller goal; making /sys/kernel/btf available to userspa=
ce
> on systems without CONFIG_BPF_SYSCALL? This would just involve a small re=
factor
> of the BTF module-related stuff in kernel/bpf/btf.c, moving it to btf_mod=
ule.c
> or similar say. No need to split out BTF parsing APIs from those actively=
 used in
> validating BPF etc, since a non-BPF_SYSCALL system would not need to pars=
e BTF
> in the kernel (just make it available in sysfs.

Small refactor is ok, but in general I'm not interested
in complicating code for systems without CONFIG_BPF_SYSCALL.
