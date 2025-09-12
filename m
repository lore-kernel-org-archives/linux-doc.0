Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A41E272E46
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 06:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757657860; cv=none; b=CrK/G0Kg28OPyXK6rAgookSCRtfX0EH3JTnAhYDxX+bU2j3duzCftzViE/Ql5BgkZu8VevYBaLzKGdi93uJLeylF1IyScTrPCey5ps60OKm5d1P+QDvu0Uq24t89j9OUDhxgxOpdEW6XwH3wq9Y4cyQpmNAUAGmVyy2ygl49Xuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757657860; c=relaxed/simple;
	bh=VCcMt9kSmVuI+oLBO+GMF7hXpwGMEbiCf97/yqR2xPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eSAjm/lvqnJSgcuKkAclCOdNynFrL2V92DA3wYHG/Zt5C48xnefPoH43YoQZL0tf4jv0FnIh1AkD7BxK0jlr+QXQ3ewxIFS8J0qah2M7WquZzqWh2kJK0qn6YyJ+8Q0dpJDNC8/dPRnL2B3NpSwbvcWUnd4PUdPtiV8e+BHy2KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhsZ+DSV; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhsZ+DSV"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-76637441569so8920886d6.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 23:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757657858; x=1758262658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WWGyCUuZdV1EHEOEIjgPm/mrQqWEYaNzVIoi/vMBsI=;
        b=NhsZ+DSV6vJuACJMuoAJydl+77dvS5UjG6qhhapYd40IC6Opbywz70pXU0AeipQHmH
         59mg5xOSJw46XSIWim5jw+jW+K8YadpVCUIivDfsKBaoMLxn6IMXXtr3gYukeMQEQFR2
         9OgmlJNYnsrgsXm5PnK1FLcdfJ+jWQ5auhUvLswPS09ZzSXr8LtrtOrkmeVbXK8dJrGh
         hCtu09VEwUnDeQr+f97qaKt3Ipezfi4GcIEdQtH9B4kN982h5n2NXKUK6XKf7BIcQFZh
         wFUcpceGglDtCrpxFrvqu6WNQHZX/Vr/G0qZkMNR5XEr5eVdYbrl+4t8qMotd13UmgYp
         uTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757657858; x=1758262658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7WWGyCUuZdV1EHEOEIjgPm/mrQqWEYaNzVIoi/vMBsI=;
        b=T1bWZM4olsPsUmIWstqmne6URHerZE2MASQwbzcjZirAzik/He7uh6Up05S7308BUx
         76epXG2tY30nDqNIa8JHBdYG7ruMhKPtxeXdT8/+RgdrUf8VmXExFq6RVRH71LbZGtB7
         mpmPC2Eg/YCsvtXB4bCPaO304p34QQha8fHTOapEdpNCLTk3BguON+dHMJ5FE7Iesx7D
         +8RpgXobvKUmmU4VPbbOFSwFpNAM8YKmAgPW+xE35RXC6sWYJn5N1N9k28sdtI/e+4dp
         7G3sgiTRL1ZAVlet6qWFLhhDsNgL8+WKac6CNUr6K4sgHFIopc39o8KwAhTOh/T9NlBg
         PeYw==
X-Forwarded-Encrypted: i=1; AJvYcCVhCjYPaSQZpxeA//SkMPv/SU7QP1BZJ2Db1hdxICcNwW7hgNs9aqQNRqi/Uo12YfV00DGszua0UaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR6Io64O29tHtqDqNJ7LgG9+FOyQjiuUwiklCEhAmu1BtSiET7
	iBA5sBOqHcMZrgEmtqYfxt8B7CIj7p+C3uV9QnJZXsCOm9ROyhkMHK9AQxvmfWGcX+SbclTAqGB
	APzox3wiSnglrspxL0skWuZ+b9J45nMk=
X-Gm-Gg: ASbGncs0WNKkaJzoCHu11JvhDve//W77Kmjw4YwGnH4kzjN7mepYwGssmU/NRa24mQf
	jsrpwoJZ1jvXa1J1SDB41gEHbxch4y3YQcCICStdK3fCsP5cKMqBxHesMlJ4lR5V5XNJKIzylwc
	bWfJdQz2i16LCziIkJVPsFDmUNJsqxFVPgGlDjVLkGKQXxIkjZo3GMYD10YWBGFGbhz7GK30GxX
	YJyRQkeoZdKJHVs4Hz4sJN+1q32GXIqBYxaHd/r
X-Google-Smtp-Source: AGHT+IGsdxrMUwO66zyxcaOyDhR09VefUjnvjDaDalrVSZ9mO1oVYWAYO/gDr2tnajPfO/UmfeufsmnzL42cxODCEHE=
X-Received: by 2002:a05:6214:5194:b0:70d:9291:bdd8 with SMTP id
 6a1803df08f44-767bd2867afmr24033286d6.30.1757657857633; Thu, 11 Sep 2025
 23:17:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910024447.64788-1-laoar.shao@gmail.com> <20250910024447.64788-5-laoar.shao@gmail.com>
 <a2c122f5-ab6a-4242-9db8-e5175d5b27b3@lucifer.local>
In-Reply-To: <a2c122f5-ab6a-4242-9db8-e5175d5b27b3@lucifer.local>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 12 Sep 2025 14:17:01 +0800
X-Gm-Features: AS18NWAElABe6YxAnTyuKf4eBKqvYfeYRWi6vWam3_rOLjoAUz49-TaObmfWXCg
Message-ID: <CALOAHbCSudQ9y1UdD4YjuUFGae5bRu8_0bgThJV4WgwLwtcwew@mail.gmail.com>
Subject: Re: [PATCH v7 mm-new 04/10] mm: thp: enable THP allocation
 exclusively through khugepaged
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, hannes@cmpxchg.org, 
	usamaarif642@gmail.com, gutierrez.asier@huawei-partners.com, 
	willy@infradead.org, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	ameryhung@gmail.com, rientjes@google.com, corbet@lwn.net, 21cnbao@gmail.com, 
	shakeel.butt@linux.dev, bpf@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 11:58=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Wed, Sep 10, 2025 at 10:44:41AM +0800, Yafang Shao wrote:
> > Currently, THP allocation cannot be restricted to khugepaged alone whil=
e
> > being disabled in the page fault path. This limitation exists because
> > disabling THP allocation during page faults also prevents the execution=
 of
> > khugepaged_enter_vma() in that path.
>
> This is quite confusing, I see what you mean - you want to be able to dis=
able
> page fault THP but not khugepaged THP _at the point of possibly faulting =
in a
> THP aligned VMA_.
>
> It seems this patch makes khugepaged_enter_vma() unconditional for an ano=
nymous
> VMA, rather than depending on the return value specified by
> thp_vma_allowable_order().

The functions thp_vma_allowable_order(TVA_PAGEFAULT) and
thp_vma_allowable_order(TVA_KHUGEPAGED) are functionally equivalent
within the page fault handler; they always yield the same result.
Consequently, their execution order is irrelevant.

The change reorders these two calls and, in doing so, also moves the
call to vmf_anon_prepare(vmf). This alters the control flow:
- before this change:  The logic checked the return value of
vmf_anon_prepare() between the two thp_vma_allowable_order() calls.

    thp_vma_allowable_order(TVA_PAGEFAULT);
    ret =3D vmf_anon_prepare(vmf);
    if (ret)
        return ret;
    thp_vma_allowable_order(TVA_KHUGEPAGED);

 - after this change: The logic now executes both
thp_vma_allowable_order() calls first and does not check the return
value of vmf_anon_prepare().

    thp_vma_allowable_order(TVA_KHUGEPAGED);
    thp_vma_allowable_order(TVA_PAGEFAULT);
    ret =3D vmf_anon_prepare(vmf); // Return value 'ret' is ignored.

This change is safe because the return value of vmf_anon_prepare() can
be safely ignored. This function checks for transient system-level
conditions (e.g., memory pressure, THP availability) that might
prevent an immediate THP allocation. It does not guarantee that a
subsequent allocation will succeed.

This behavior is consistent with the policy in hugepage_madvise(),
where a VMA is queued for khugepaged before a definitive allocation
check. If the system is under pressure, khugepaged will simply retry
the allocation at a more opportune time.

>
> So I think a clearer explanation is:
>
>         khugepaged_enter_vma() ultimately invokes any attached BPF functi=
on with
>         the TVA_KHUGEPAGED flag set when determining whether or not to en=
able
>         khugepaged THP for a freshly faulted in VMA.
>
>         Currently, on fault, we invoke this in do_huge_pmd_anonymous_page=
(), as
>         invoked by create_huge_pmd() and only when we have already checke=
d to
>         see if an allowable TVA_PAGEFAULT order is specified.
>
>         Since we might want to disallow THP on fault-in but allow it via
>         khugepaged, we move things around so we always attempt to enter
>         khugepaged upon fault.

Thanks for the clarification.

>
> Having said all this, I'm very confused.
>
> Why are we doing this?
>
> We only enable khugepaged _early_ when we know we're faulting in a huge P=
MD
> here.
>
> I guess we do this because, if we are allowed to do the pagefault, maybe
> something changed that might have previously disallowed khugepaged to run=
 for
> the mm.
>
> But now we're just checking unconditionally for... no reason?

I have blamed the change history of do_huge_pmd_anonymous_page() but
was unable to find any rationale for placing khugepaged_enter_vma()
after the vmf_anon_prepare() check. I therefore believe this ordering
is likely unintentional.

>
> if BPF disables page fault but not khugepaged, then surely the mm would a=
lready
> be under be khugepaged if it could be?

The behavior you describe applies to the madvise mode, not the always
mode. To reiterate: the hugepage_madvise() function unconditionally
adds the memory mm to the khugepaged queue, whereas the page fault
handler employs conditional logic.

>
> It's sort of immaterial if we get a pmd_none() that is not-faultable for
> whatever reason but BPF might say is khugepaged'able, because it'd have a=
lready
> set this.
>
> This is because if we just map a new VMA, we already let khugepaged have =
it via
> khugepaged_enter_vma() in __mmap_new_vma() and in the merge paths.
>
> I mean maybe I'm missing something here :)
>
> >
> > With the introduction of BPF, we can now implement THP policies based o=
n
> > different TVA types. This patch adjusts the logic to support this new
> > capability.
> >
> > While we could also extend prtcl() to utilize this new policy, such a
>
> Typo: prtcl -> prctl

thanks

>
> > change would require a uAPI modification.
>
> Hm, in what respect? PR_SET_THP_DISABLE?

Right, when can extend PR_SET_THP_DISABLE() to support this logic as well.

--=20
Regards
Yafang
