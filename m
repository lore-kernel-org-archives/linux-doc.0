Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4C230DEAF
	for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 08:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761122633; cv=none; b=Q3gJ7XZBzPhZ7qpZd5IJ6eAgmngPf1t9X53Pzsu19pPatvM9tkxudOujfgvBnBu04l9135egxqaNOuAMFhcqWU7aFAdFSJqw55p+YDZBMRtSWJKfF9yYtH1lptUOzKDaPm5HVcjJvC1YCyw6mC1w16/v6hhQ9aos1NJQm7JKkzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761122633; c=relaxed/simple;
	bh=MQFGP/GdT+B0HEH10HMoHyNYcc8pQAd8Ff5+/hU6YTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rWU1EcXOqoqcgrA6Rpy+HUHIg3Wp52Dl1//5FdXQMzX/sn5IoUMTu+D/3Fj7ZMQ/jtN15sWeFEkXJeXBLj45CfdRh725BvAJFX2vSUN1TSUuFlQi8aXGql4hrM9v9C2yyksM63IZry8jwKkG7H7haz5XaD0e7YeMjI5r3CVjNNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H/niiM1Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H/niiM1Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761122630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jkHMky5mCobEjmAGe9TQAKstGmetuf8oWgBGBX4vP2s=;
	b=H/niiM1ZYtr2S+9WmRrcF46HDQfkHsy8/yrHnRJv/2TKhLJ0X8uI3YID9tQbee74pY+9wN
	URlvDypR2oHnCN1PLorZ25wzjXtDGftplHM1p1A9LhxIxQC96hCbsxSE1yEIFGoPn0Ip+T
	1Pf23WJgjsNffshc7ARHgghWNcHJCmU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-zli8nQEBNjCVQEGnux8f6A-1; Wed, 22 Oct 2025 04:43:49 -0400
X-MC-Unique: zli8nQEBNjCVQEGnux8f6A-1
X-Mimecast-MFC-AGG-ID: zli8nQEBNjCVQEGnux8f6A_1761122628
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-42558f501adso2679586f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 01:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761122628; x=1761727428;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkHMky5mCobEjmAGe9TQAKstGmetuf8oWgBGBX4vP2s=;
        b=W5lXzNxyfhoyvIeAphHjn9UKt2jH1W0c0vGSov1+HJn6Tp9IMnvAH4QMDjRKRguLWD
         AuR9DIjFA47P9UqDdKQyQpVf/6213kemERm55teaq5DkWfIElT13noxQTpzbhp/kzsFz
         zKJfkkOrXSWVrnolHgwZqimJ2NteiQ03GYdbaU7rqPZe5TTp3YrefrS/LIbw3JjalXsg
         +nCaiKBs5tzCN9sccD4wtEDgziOo1ahCTYzj16dG9PXFuSraPRxRQRZh3svNx0FHGtWt
         cYnR6E6dgR2X+sh2NtvfCwoUhAOFk/FhH2IQfwiXVHrhWuvZHOcArq6aqeipAY7N0Zqk
         mTYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWr/B6UbGYzRF41Wj4mDnURmlDhHJoGogH05zIMlFk7mluzkQ7xR7z4sr47Dmqh0yTjNn5sy47TZk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9N1Ns7Q5DFAyoMeVVWD8us5flNVTsqDcEoLTCxTRhAtmtXFjt
	Z9fKAwb5sXp8/aADFVjFWDdKQUKrIb3w1LgUNkiNcr9guY1CcGm5oPNKsJrDg379bXH/UQW5Ryx
	DZsdz3txmkoH6PN4fjddyLdd8FZAD5UariKSatmHIZUyTQPFz1btVkl/m+YNnnQ==
X-Gm-Gg: ASbGnctdebweOV4gM8zOMvFGkhOFAjaPAGG+aiojxRSZeb7T4FS/0rDYaTca56G10Px
	ieiBeSpoWj8X0Y/+nuK0P/1y/VrUIb7/8Dbq7JlNr/eVCHFp4evQ0TpVqPiLZJ1RbaImYGSRozA
	hTEuBvPR3H0QpWt4x8TTgmp1qog91d0FmRx0BtKFuP4vlinto+69DHjgttcMlbh+v06kp91Grb6
	/NcGPuPtpL+uh1wyefEyU6zfdJYSg8E7jwOqcA+JXoThVsOSc6vms12uXHIeLPSN8sASA++FDgN
	Vam7a96Mc+0m0z7PRG9kuq42pk29YsIZL+9qV/By5Xc5IFR3Cp24j8ayGHVKKL6sErXGjexYx0M
	za3x04MQeb3m5R7+y4byQ31TLV6Kcu255cNuZ+j/VRePZhz3+I/P/z3fBZRuucW6Jx4IVxqhCxY
	QW/QMpgE/nX0eMWo/UXcki8XSBIKg=
X-Received: by 2002:a05:6000:25c5:b0:428:55c3:ced7 with SMTP id ffacd0b85a97d-42855c3d35amr870754f8f.28.1761122628112;
        Wed, 22 Oct 2025 01:43:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwoT3C4h+2nYRtAEAp4gukXLbzQesuywB6jEq9IZ/b7/4k/4nUiirxc9OucZncsYgrM1Y8ag==
X-Received: by 2002:a05:6000:25c5:b0:428:55c3:ced7 with SMTP id ffacd0b85a97d-42855c3d35amr870716f8f.28.1761122627657;
        Wed, 22 Oct 2025 01:43:47 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-428566a7906sm1313560f8f.38.2025.10.22.01.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 01:43:47 -0700 (PDT)
Message-ID: <4b280f08-7ed3-416e-8f8a-d30cf0b34c01@redhat.com>
Date: Wed, 22 Oct 2025 10:43:45 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/23] drivers/virtio/virtio_balloon: stop using
 balloon_page_push/pop()
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-doc@vger.kernel.org,
 virtualization@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Arnd Bergmann
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, Zi Yan <ziy@nvidia.com>
References: <20251021125929.377194-1-david@redhat.com>
 <20251021125929.377194-12-david@redhat.com>
 <20251021165854-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251021165854-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.10.25 22:59, Michael S. Tsirkin wrote:
> On Tue, Oct 21, 2025 at 02:59:16PM +0200, David Hildenbrand wrote:
>> Let's stop using these function
> 
> these functions

Fixed, thanks!

-- 
Cheers

David / dhildenb

