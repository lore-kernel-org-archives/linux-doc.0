Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C272221638D
	for <linux-doc@vger.kernel.org>; Tue, 15 Jul 2025 15:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752593954; cv=none; b=q2jCNdXovFy4YIFLDFtRLWGucBtWyxvg4pUsa27c/BfdYyM4apELgm/gdOEN6G2MxxwW0TRETlUlcdyLXOL0qU3wk6RwGqrV6hCljQfnR10FwFt83z/o1Hj8+N+78PsVJyIcVcdUQJbwC/WIfFJGffQAgXZRLkk/hddG+cF/exY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752593954; c=relaxed/simple;
	bh=dTz/J9wlC+nywxQTpGo4UF/Z0sNT7Lcm+tM61+gHrNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lzCGanDMZvD/kHWsX9M6G4im7RslJ0Y5efSDh5p5XZq7F2bk9eBQic0trtN654pVUC6Ae9XEAJ7Am2SJkCQaGThBILBNZXTfurvG0vSzWrwgl8u+yJHB1CDRUt0eQa0IAY233b2fGTh2JpTSz4zrwhA1Do6UXSar+UvYBjhth5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mf+4EU1y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mf+4EU1y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752593951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UHM4gZNCeGPf0Dq25GgumpITXaeUKp0zRvBNhoIXd98=;
	b=Mf+4EU1ylWMaOu2sjZpP9WBuDOXofTRBvj0nfBSZt0d0nwO6D7MpbKc2eG9h9BEaN9TUe7
	KRGn7yKOnghnJZ9WElG0ebqE3x0NJJmCkQn0pv8dym5vfYRapfx2Y52uItF9gOt+ALVUlx
	nRCDeNEWKvDcZswUzhrn0h6BIBALHDw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-ZpZyrarrPkygh0i6q63dig-1; Tue, 15 Jul 2025 11:39:10 -0400
X-MC-Unique: ZpZyrarrPkygh0i6q63dig-1
X-Mimecast-MFC-AGG-ID: ZpZyrarrPkygh0i6q63dig_1752593949
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f85f31d9so2221496f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 15 Jul 2025 08:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752593949; x=1753198749;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHM4gZNCeGPf0Dq25GgumpITXaeUKp0zRvBNhoIXd98=;
        b=wiFnsYWhD0VdsYaTJZAfH/aycWJzOTDfjiU+zlbHrcp4n/jsp4G9mv2KtI15ysAwYo
         jFk/7Bqgoq1vkX5EesNPVSOXf6+gO8qCd7b5tS0Xhhyb2k8xGAjhFPfFHrqzrP0FvENh
         zjzYhLzjUpX8csm0t4Y33lrrGjSeuxpv8Df9i5tFA72NYFcYYqlMUamUysjmi2F1mik0
         hCtNQrQSKLSmztvhhA9W2bE7OkY07CU+kr2dQ+meGH6g6Uh/0ZDyPPALq38Q57ebbkiu
         98WP0ejdrqqOs8iYYnT/ge5UK30ZzHroLiJZEwFLce+iQnrhge2YmLgdiM7maFUzMZ6y
         ZRcg==
X-Forwarded-Encrypted: i=1; AJvYcCUH6+lylcaBJ2QsdYTnj4eqmGv1glrBvzbASl1MV/DMQsTSxsd0Y2V6TpL44N3ZeXsVB+KJyCKbVVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFNlMXe6B5QJUnHVtF+hWsJmeKdxSOJkNbdAvDJr6YRdT8cgL2
	oCRDXol6oGKk3DKLQ0OWy+TKXOmvYrn4EFPQsxdDOXp2do5PM1W47MfbAKRWavEb/3TGPpqp9Kc
	c3bxkivg2XzKfjxviVHG9zRteg5gcldNp2QCuwzHoPbtZ4ni15NmRE0J+OzE9Mw==
X-Gm-Gg: ASbGncva9a0r5xRSkDPpe23iDz5VPmRQvCAFJUKRVsup059isLy+CXWx4q3d9vucKLT
	lfj6I2GRqd1VfYseDDE+P6EC/OYzO8bw70A+IPJEpISykUCCCMsYpkHd5ha4D84JOSqw7eDExnF
	usr3I2nC4T7B8bKYjprb99qqud2YoicB9jZh39+jNHYGAbyu8lyat09xv/Def06QLbyoBeGjgtU
	0IyMQu6Ai5593ktcqsRedeyiYc86K7Dcf3ji6xSXQX2++Gs/73rbzCO/545HQpZznLWIaejwH4t
	ckvVt4oteROh9a36O+QYO5LLZt4WLWf0Vm/VxhOYlfp6yXLkEGifohPZ4XJZNnhzhy1Tjs3sk1S
	N9YYnrft4vfAPySHbHdP5ZzZB0ri1pQYQRamresK2HFXUqNQVUZVhUg9vYwFWsU0TGe0=
X-Received: by 2002:a5d:54c1:0:b0:3b5:def6:4e4 with SMTP id ffacd0b85a97d-3b5f18dc957mr12722528f8f.46.1752593949288;
        Tue, 15 Jul 2025 08:39:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtrPZ5XjleiUjEdSdNotNWI9zAnnUxsYftwPbMASEv5sC7k861KNZN1awNoAXfH+5ERC81DA==
X-Received: by 2002:a5d:54c1:0:b0:3b5:def6:4e4 with SMTP id ffacd0b85a97d-3b5f18dc957mr12722472f8f.46.1752593948800;
        Tue, 15 Jul 2025 08:39:08 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f28:4900:2c24:4e20:1f21:9fbd? (p200300d82f2849002c244e201f219fbd.dip0.t-ipconnect.de. [2003:d8:2f28:4900:2c24:4e20:1f21:9fbd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd1792sm15715844f8f.13.2025.07.15.08.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 08:39:08 -0700 (PDT)
Message-ID: <f51d923e-da89-46d7-8e3c-702f055b78ca@redhat.com>
Date: Tue, 15 Jul 2025 17:39:05 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/14] khugepaged: rename hpage_collapse_* to
 collapse_*
To: Nico Pache <npache@redhat.com>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com,
 dev.jain@arm.com, corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, akpm@linux-foundation.org,
 baohua@kernel.org, willy@infradead.org, peterx@redhat.com,
 wangkefeng.wang@huawei.com, usamaarif642@gmail.com, sunnanyong@huawei.com,
 vishal.moola@gmail.com, thomas.hellstrom@linux.intel.com,
 yang@os.amperecomputing.com, kirill.shutemov@linux.intel.com,
 aarcange@redhat.com, raquini@redhat.com, anshuman.khandual@arm.com,
 catalin.marinas@arm.com, tiwai@suse.de, will@kernel.org,
 dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org,
 jglisse@google.com, surenb@google.com, zokeefe@google.com,
 hannes@cmpxchg.org, rientjes@google.com, mhocko@suse.com,
 rdunlap@infradead.org, hughd@google.com
References: <20250714003207.113275-1-npache@redhat.com>
 <20250714003207.113275-2-npache@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Organization: Red Hat
In-Reply-To: <20250714003207.113275-2-npache@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.07.25 02:31, Nico Pache wrote:
> The hpage_collapse functions describe functions used by madvise_collapse
> and khugepaged. remove the unnecessary hpage prefix to shorten the
> function name.
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Signed-off-by: Nico Pache <npache@redhat.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

