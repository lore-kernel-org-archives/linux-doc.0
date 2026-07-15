Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAABB346A04
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 05:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784095067; cv=none; b=P8ceVrTC80GSFBqCGxIn7unea6WN1RJTls9HPA2spQ1nGJAedPAqgKCEuGX0tLKBVTDxuGnJxZ7lomDZBocD5yLvjhHQfUzLfGa7HKSDmBVFwFULgq7A326UZDOzKsHdMEiqgYsprVz3tB7idmfphddzIiERVKfOAX47Ue1O4iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784095067; c=relaxed/simple;
	bh=AxhU404+8gisR0wepl2FexLZ8ri4j5Bdrr52h4XBFUQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IV3QXXhtFum5p2xjihfFpp7yvno55TUVjXrbLa8uaqpIlpzX72pe/g15aJ9tclBPTS3YvjVekm9bi7cHmcLS9zEA2NAjYrlL0qnZcXfHVr3MWzVAn06mNyVvmMtHXeL4wGmJFhZaK1PE8M2Pq1lJnkhAh+SskKdQXcJ/IwE8hc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K7gG4j6W; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=X7z/9uMV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K7gG4j6W";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="X7z/9uMV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784095061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kij3xGA0X8XYDtppR8rZ3L/GKbMGs4DT7boZ6eQOym8=;
	b=K7gG4j6WZ4vI4KS8ovmLks2529xSlgfjZnAUajmy6ccNKorFuzI3y5xEM3YQsbZDOHgiP1
	R5Oxk7WkC47xTOagWpKQlFxYU6rcnulfWKq8H+9aOR5J3ykoV98J9Q9FACx9FJckDjTrtZ
	V21BB/k0FKnF/hC/sYx4peTGn/yGxhE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-5RFXNN1iPciNi5fRoJKPBQ-1; Wed, 15 Jul 2026 01:57:39 -0400
X-MC-Unique: 5RFXNN1iPciNi5fRoJKPBQ-1
X-Mimecast-MFC-AGG-ID: 5RFXNN1iPciNi5fRoJKPBQ_1784095059
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e53b8a302so728244185a.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 22:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784095059; x=1784699859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kij3xGA0X8XYDtppR8rZ3L/GKbMGs4DT7boZ6eQOym8=;
        b=X7z/9uMVS7jRbizOFyHqsYXZ1OXwFdfzTKR/5ih3Cuz4vha0/M/McSzypPnPG7Ygyc
         szvoXTCgmJGqNMA+XfRpzwwlbBWFiVrRjXFeAnxX5v0XtWZT92KOAjFdK9lHqdLCDLpd
         wFE6S7bOJpzHAOkVGnzTCAbh6O/QtRfopyx4+7jL+VUtKDkBVnwVZQumFbo2TOUC/FOM
         xhHfnz52z0YyJcsb01E/MDawr6swpUYX3BFZTjfg7dPMLImJdt9MnxG5Ci9AcunMpLFj
         qblxXwKssQRt99E5PB+5SCgpBoH65/FfXG7gFJIv54maEboYpUcc4VT2c50Bna1+/EER
         SHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784095059; x=1784699859;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kij3xGA0X8XYDtppR8rZ3L/GKbMGs4DT7boZ6eQOym8=;
        b=BA854UOonvWzgaa0cdBj7wVZsVWPKVIbFxCOZMJncdbAdC6RwwYy4I+KcEiUKycHZH
         EXwNnNwRAF6KgBITt1tvVYZOe0Sx6ZrTGfLSebHCZ22LP0qx95Be/An8X9HpyUFNy1M8
         Z4rfPlPO6Gv4nK8/s8OZeTC4NdgV0/07i4E5arOSjECCLWJ4f2gE5MS638QkNVRIjzAZ
         2oXNWKqxVqTo8hdIcoVrfUTtObK8/sQogHHte6hL2IeCCAQLveHLdLedRlWK5Y/+o8vo
         BhD5prdRGw8XN1/FopNjxW9yap9tTnTEIIzYBa9hEz4hiedHJgLnnPB8GPIhBvAGNuNF
         DiGg==
X-Gm-Message-State: AOJu0YzoNQysrBWuB9XP31rWw2mCIhGdqXBeNXJgGoEyzPu64zTD07/H
	OTGOSQnEVNTS4oStpoCr/wx1DmZ25qw59iUkaKYvAbCPe27lbzQvHvTf/8s3Va0/xj19XkSfy1L
	OywxzQXgeidvtMOj6DA8Q10du/x2qhCuZ69MjKy4IVS5ATS4mW7sEPal3B+NtOQ==
X-Gm-Gg: AfdE7ck44fTE2BxNjJ5pnMWlDZdFTSdC2qHZoUzFXIJnOy0qCKwQb/BbCT1UCfcIay/
	fwXxFfCva4WK87rzh/D9D2F+MMm2tLLVt/rR4QpxCAte37QkiVo47bC53YgBXrztM7BbCHwUmug
	0FB1hk1gRcgAdtZciyf1v6iG1ciOf+X679NzDJLX0KVwEUBHF5Y6g8VPDiy8gen6f63ygoxNDVG
	bkyUUQpXHsPY3tG0dzTrelW6J9RiTnhckt2AwbOYAMfff6JeU7pUpB/OkTqOJUnyUN41t1d/RqM
	50+e/DZhh36BiSL4SiWie5p2wd+8Rr/UJnTTbBUDTzJZKjk40G1351Au0+PRXy5p+S8/E5noX04
	W5UCvXsOGRA==
X-Received: by 2002:a05:620a:1b92:b0:92e:5610:e478 with SMTP id af79cd13be357-9309627ff75mr119500785a.53.1784095059249;
        Tue, 14 Jul 2026 22:57:39 -0700 (PDT)
X-Received: by 2002:a05:620a:1b92:b0:92e:5610:e478 with SMTP id af79cd13be357-9309627ff75mr119498285a.53.1784095058764;
        Tue, 14 Jul 2026 22:57:38 -0700 (PDT)
Received: from [192.168.8.207] ([45.81.3.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-900a7f8f5d6sm173173106d6.15.2026.07.14.22.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 22:57:38 -0700 (PDT)
Message-ID: <b2661d8a-13cc-42d4-a850-a6f70a25e090@redhat.com>
Date: Tue, 14 Jul 2026 23:59:17 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nico Pache <npache@redhat.com>
Subject: Re: [PATCH v2 0/7] mm/khugepaged: several cleanups
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260715025941.1571316-1-npache@redhat.com>
 <20260714214121.090238f5f0f318f8d82cbaa2@linux-foundation.org>
Content-Language: en-US
In-Reply-To: <20260714214121.090238f5f0f318f8d82cbaa2@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On Tue, Jul 14, 2026 at 10:41 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Tue, 14 Jul 2026 20:59:29 -0600 Nico Pache <npache@redhat.com> wrote:
>
> > The following changes stem from a number of reviews during my khugepaged
> > mTHP support series [1]. Some of these are minor code cleanups, issues or
> > reviews that we decided to deferred to a followup series, or in the case
> > of the more major patch of the series, changes [2] Lance Yang attempted
> > while my series was in-flight and we decided to wait till later to try.
> >
> > The first 3 patches introduce helper functions to increase code reuse and
> > readability. This includes a per-scan state clearing function, extracting
> > the young page check into a helper, and a count_collapse_event() function
> > to reduce a repetative pattern used across mTHP collapse.
> >
> > The 4th patch was the byproduct of me throwing Claude at all the
> > comments in khugepaged verifying and looking for any outdated info.
> >
> > The 5th patch is based on Lance Yang's commit series [2] trying to extract
> > the PTE state checking into a helper function. This required a bit of
> > rewriting due to differences after mTHP collapse was introduced. I also
> > took into account the changes requested during his patches review cycle.
> >
> > The remaining 2 patches were review points during my mTHP series that we
> > agreed can be deferred to a later series.
> >
> > Thank you to those whos reviews and work I leveraged to achieve these
> > cleanups.
>
> Sashiko seems to have a good point about [5/7]:
>         https://sashiko.dev/#/patchset/20260715025941.1571316-1-npache@redhat.com

Ah whoops! When i sent the fixup for V1 I only did it in one location when it
should have been for both callers of collapse_check_pte(). Sorry about that.

Here is the fixup for the missing variable assignment

Thank you,
-- Nico

commit 52adeb9998fe84c1f997a3b3b6e98c93f9754c95
Author: Nico Pache <npache@redhat.com>
Date:   Tue Jul 14 23:50:54 2026 -0600

    fixup: always set the local folio after collapse_check_pte()
    
    If we dont set the local folio to the result from collapse_check_pte()
    we can end up with cases that the goto out will result in pointing to a
    stale folio from the last successful PTE check.
    
    Signed-off-by: Nico Pache <npache@redhat.com>

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 40125dcb4de9..e5e349d0662e 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1747,13 +1747,13 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		cc->progress++;
 
 		pte_check = collapse_check_pte(pteval, addr, &ctx);
+		folio = ctx.folio;
 		if (pte_check == PTE_CHECK_FAIL) {
 			result = ctx.result;
 			goto out_unmap;
 		}
 		if (pte_check == PTE_CHECK_CONTINUE)
 			continue;
-		folio = ctx.folio;
 
 		/* Set bit for occupied pages */
 		__set_bit(i, cc->mthp_present_ptes);


>

