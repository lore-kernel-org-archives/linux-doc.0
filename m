Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABDF383C84
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 21:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787953756; cv=pass; b=Of1xjIuSOM+K4fhFn4pJNGDqcMCDIvisul5PrlnTIFnYNST0o343Uhzgek4QuSLjHFU+p0ZNi10fJBS2o3i4CckhNEhaxogu6Qb9ZRgwGI+QetMIx7RlxNHGEj5RurT551i9AdcshrAgQhTDoB0zeq1ufWWelqrNI5E+LmxfjMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787953756; c=relaxed/simple;
	bh=NS7ILyNRDwIZOyOLSfg3QhGucIcgXedbcky3j8j+fgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIXiSjgLRZ88PT/H738dvDqzEgrYO5r0KMzLk5SkPOWSzqokTXy5F0AP61scc322F0kTKdMidQTJ/3zSMwfKNhFu6LrI/1hhFh7rzKaWu5/XDA0ECwSaJIuYDnyuerlO7bIzpjQeI//EzeGltygTfOJ1JydUcu/Zl879RBZBelE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IIt3FcPu; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IIt3FcPu"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-52fac937235so33081cf.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 14:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787953754; cv=none;
        d=google.com; s=arc-20260327;
        b=K6gSduioeBSudMJxMJ08nS49le4nXLwKVJ2pbQlmV4WmReTs9dDhM8JvU9XXAMOFRY
         moyZ4AnbNn+HNhUb9+AEpb8vJTeWPX2XpcXOfcO72PeflqqWSDhLTTNXjwhLI5IeULv5
         FKyWAESq2vQFiyfNloxVSB90haBuU/A0VhEhwrDBQfs3GGJ+4FndlUbi457Hd0OQrDcA
         Mya7r0H2w1W7f8qJSPiGxu9NuBQDGp8XX5fpdlTlu3KMha/2LyYdDRFPk6xU5CWhO3/E
         FysbJMmjmwaN6NZdbLIBckdrHXUW/rasyITz5tc8Ezxluq/eZ563voEzeKrvFFtni8Bq
         3Owg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NS7ILyNRDwIZOyOLSfg3QhGucIcgXedbcky3j8j+fgE=;
        fh=XXsSp8Ax95mzoij4VmY1IrrPOJDyulajp7n1Bmgk47c=;
        b=G7s0BfYxuk1Xn+/f15BbsR0n7eOl357hxZPhYE16FxHplqCVbW2hXWyGLisJymLS34
         NWSOHEd8pEceb3cKgYwP/8TGNjADbcxKafX1bniMj9UrkJk1nqGUmqrN6fFcDoNaJjjf
         TeqAkNA08y0vVFicoYwdty4jIAcFnkxPlR7CqpLWkd6HoODCWUa92yWvC2BsqOThsDB6
         P43bj/p8HINli7yD5EsOmA2r8kxhAVl7iSrA+xRfIFca/nbKEHyhFvm/lsO7C1lcWp4t
         229ZRY5UDYyeAvw0XGouehJdqGEX68zqlb0VrKGEiiSpR951nwuSLlXwlc9GS3GhqP+q
         LNog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787953754; x=1788558554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NS7ILyNRDwIZOyOLSfg3QhGucIcgXedbcky3j8j+fgE=;
        b=IIt3FcPu4gwqfcq0f43QVaw7Dy4mof+meN2gRiV/1YL/6T6vUBCh8TtVKISBYcGVnf
         zIwHvuK6O38b70jcy3+QkDyZJgBVazXbOzxrX2OoA+jly3OM3tXP5DFpl4vPpuaKinLs
         iPEoUV92oh1OIGegntnS/8TELhCiXr0Fx8pp90rbAXE5v2S9Vjx+8QQrC+xrV7IxB4hh
         Mrj7NM8KEv+p95oZ5eAkHq/poNVcTw5curLEsp+YK9dcO75taU++qfXBWM0KGYQoZwXZ
         oAw8wV2Xb4ssZXg2Vu9nFGX8vwbFrHd3Dp+X4gRtr7BHMp6KB+jFbV8LhS2nyd7tw8X6
         wf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787953754; x=1788558554;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NS7ILyNRDwIZOyOLSfg3QhGucIcgXedbcky3j8j+fgE=;
        b=aR6bp6Sh2HzUFAR4ZvXLw+N3FDR28nlKkjXZaFng1z7u0nHS/z+O6tIcWgtHHmGufc
         MfdkwmrMi8TeO3s0J3vBNIxeQuJ06vkk8nxuofSAgYR+PKf2xMTFDjKAfhhFVBhjNIW0
         t+iS4bJiJ2vLFuYdlpk09gmsXtgCJP5rJx8g7/+VPDJOotp9TR1LCM5tpvcQbA+XHadX
         57t2AUilr7ziNd1y8ciFCGC43QAiziJhGDWsFsjeWRdo8eBPGku+1eWYXn+Q+Bc374Nc
         fh+JDd6d97XvYhcnzZWRLqdNV5ql+oQGLnyaUEu1TY1o7qwafSgWVzLuMH1u7oweihpQ
         j+ug==
X-Forwarded-Encrypted: i=1; AHgh+RqEBYZuElE+flBciu4pifYr7a+8ab9S0pCRkiDjMWHgWsgj3zVgY0YV0BEqRHMyJI+gnogdZ8bnTuc=@vger.kernel.org
X-Gm-Message-State: AFuF++kblbFT8DEp+dVnRm4xRWwsB6KTN58QBt8YMopoUBeUsT4jIHrm
	ZbxAhO2dMwLyAqlluJQBua20AafTGdg7ATpSOMjURqoMtvQyroxFOka4Kgv7Qv95KSua25EUpHk
	BjZagGbaYi8VjWbDgyR5g1gio5sWdOLRc/frCz92c
X-Gm-Gg: AR+sD13iexluwLI3OtxKYXaWbzXKEYFwzuY1CYdmDWa7VBrSHUv7X3owzyiEoNDbB8L
	0GiBrTPbFEnYpVX/y+rHuVtkgheZ92Cx2f+8fiCMv1HsGL5gkEySQhOVb3XShPxGNIUFcNYosIP
	7IHLcyPd6SirxsDvT6MYuLB6sVTDt1q1xZO3q2XPoBsE5QlnZa3PLy8YdNJGwA9SOj086Cb/6QG
	9H3LR3O4NJHl5DR1WvyfcJnexx6TNA31SDhH+hA48hLm1x7IwkkEUdJswM8rTDufcuXCAYkHuCF
	bnMws9L71ZEE86RE8M5y9zUQ85oAa4e86Yzw9T1jPY+/mxsrfvBK7QVLzn1nZGscRcsza8w19pg
	=
X-Received: by 2002:a05:622a:598e:b0:52d:7a3c:8396 with SMTP id
 d75a77b69052e-52ff6f30c8emr5308471cf.2.1787953753102; Fri, 28 Aug 2026
 14:49:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-6-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-6-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 14:49:02 -0700
X-Gm-Features: AcwNN1WQxsNINsmJYKS21-W-S3NINHdKdRHcQQhWHhl_kYf3xtibaEfoC6rNsbM
Message-ID: <CAGtprH8Rax32PfiCk54aY_SUPkpfCKYdK5ZKaWJ5-Y8vtFSPng@mail.gmail.com>
Subject: Re: [PATCH v9 05/11] x86/virt/tdx: Handle multiple callers in tdx_pamt_get/put()
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, sohil.mehta@intel.com, 
	Hongyu Ning <hongyu.ning@linux.intel.com>, Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 7:09=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>
> tdx_pamt_get()/tdx_pamt_put() unconditionally add or remove Dynamic PAMT
> backing for the 2MB region covering the passed page. However, multiple
> callers can add or remove 4KB pages that fall within the same 2MB region
> and in that scenario only a single PAMT entry is required.
>
> Make the helpers handle only adding/removing Dynamic PAMT backing when
> required, by refcounting each 2MB range. Gate the actual Dynamic PAMT add
> and remove on refcount transitions (0->1 and 1->0). Serialize the refcoun=
t
> check and SEAMCALL with a global spinlock so the read-decide-act sequence
> is atomic. This also avoids TDX module BUSY errors, as the Dynamic PAMT a=
dd
> and remove SEAMCALLs take internal TDX module locks for the 2MB ranges of
> the specified PFN and the PAMT page pair PFNs. So simultaneous attempts o=
n
> the same 2MB ranges of the PFNs would otherwise encounter an error, which
> would not be handleable in the put case.
>
> The lock is global and heavyweight. Use simple conditional logic to keep
> correctness obvious. This will be optimized in a later change.
>
> The pamt_refcounts[] are atomic_t's. They do not strictly need to be
> because all access is protected by pamt_lock. The overhead of an atomic_t
> in this situation is minuscule compared to the global lock. Leave the
> atomic_t in place to enable future optimization with minimal churn.
>
> AI was used under supervision to collect/apply feedback, split patches,
> review code and workshop logs.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
