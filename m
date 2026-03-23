Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2826235BDAA
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 06:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774248503; cv=none; b=gan2ZHd3X6B23+eXJInp98uMPoPT94xusV0Cc0gp0Gmz1QFzq9reKAFMFI7RWnGisDW7/bvF2B/EKBaOFafY77V+iVNLRgjzIGsse2eCotChmX/7UYxRDo4QfKjA3ceDuOo4FNQAihh8UJo0qWzTdRL+JgtEtM1K+GWQvtpwNJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774248503; c=relaxed/simple;
	bh=qBxOceRaYDnXDlLbO5irFD7BqQZ8YGfUKwhYJ71fAPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qCbUsE+EZL7oGF/6XnohbCpkz1LYEErJ+Z+2N3c2Vbufiq8xPslSNb2CX3MbpSbR/Gu2v4emkmLf0fwoQ4A1r9WMVZjAzsgMXTEISYfqMdfKn2KSJG3oW1n4OU37ZlBvQNKyuACfCZP4wxkkvaJHgbA4DbzCbTNR+SL6PZSXT9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bU8yiefq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bIaNfnOZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bU8yiefq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bIaNfnOZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774248501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A1jfkKoIoyOx8Kv10DppX+EOFqlkSt8Sl6eKNbUG7kA=;
	b=bU8yiefqOx28N9f8guWihkirpGLG+HUcDgA7RwbBGCjvsykWFLOT+hHE9AQ63tqJtCGLxq
	zU66ckiqHruRTaX/gC8VolE9k2kA4Wr8I3CvVtYlUcdQBNNv9t/A+DUJAFuWZcIbcSQEYy
	OKhs3WYVbG6mX0kbMbrz3xdWUvKeQFw=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-AiRrZwaCNLauyPnqs8WXww-1; Mon, 23 Mar 2026 02:48:17 -0400
X-MC-Unique: AiRrZwaCNLauyPnqs8WXww-1
X-Mimecast-MFC-AGG-ID: AiRrZwaCNLauyPnqs8WXww_1774248497
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35a1e725a8fso19167217a91.3
        for <linux-doc@vger.kernel.org>; Sun, 22 Mar 2026 23:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774248497; x=1774853297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A1jfkKoIoyOx8Kv10DppX+EOFqlkSt8Sl6eKNbUG7kA=;
        b=bIaNfnOZZ4MmAI0wJ3/tVeDlGGkWd9fo3jO/SishyxeLYO4nv8f1KCfhhB/RZX7vLI
         0i7I0PZ4dTre/pj4VjMPNwFS9Z6fKLcv94N+Pn1e2HE1Crq9Cchc2LD6NiUrfcQkcFxZ
         DonDH8Qn042c+1PFxH8AIF9BedUWNBdtIWwHqZs0+tN6dqkzIT0MGZXMinyqbqN4vFbk
         LJxtdjtJ++0DrviUkylm++XSxN9fVgX4AWr2GpEGpTAa1owMjb9GehR1vE+ahPrNcqbF
         wsfK6257U+oOitu7vJKOdhxzrzcJyE4IB2UTgnTWR8vcdzOI+ygXXBsK+UZxBVVYw97z
         bByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774248497; x=1774853297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A1jfkKoIoyOx8Kv10DppX+EOFqlkSt8Sl6eKNbUG7kA=;
        b=br3WLxdbKwaOoEB5uUz4kikcIwymFglqGCU7p3FqZQ44o2qL3Zwzq7bDxtdiOUynT2
         GzYas1KP0CQWYuxs5D7XzOCIifRqQOm/ISr0ndMkztDq4hmX/gMC5xYyUaED9Vn31jOU
         BsIeX00v5/vd5cCjs6WeMUcuncYgLp6GG8tKC/FtUjh7sqPgzE05/J/HunsrXUnV1vKx
         NOqKrXTLWSylEhL8IBpjiG9FVb24I+cqnyqZWtb2mP/tsyxwazTtJvVmxyfTJjMCx2kI
         tC2SrzivaqRa9sY9t6OXbKV6wlOc0vQnNuRlFTgMl6K1kybh/qBCUqezTF7lyFqy+q5x
         JN3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVt6zUpnSYp0S2weTd4KWhEzX47gH6/x/jy8a3wkxBx5/eCeLzyLkzehmKOepHUGrSWXgK19Uk5wtA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDenF/+z2XtflkEYISSf6nxvdvAT2VgmxL7DDuc1iINAMZbzSH
	+gMPn8pl0mz1GmfSq9/naH5Gtp/ILIVqDMP3wlQRveyAHANe8Ip4EbZyhJm+oyMMflJNXgDKJZq
	6hNpA4AMgiclK66/oH1qoqNQkKDoj35HLSujUbokIfqpajgFNMZ6agn+o4q24hg==
X-Gm-Gg: ATEYQzyBHEZetf/j4ViZa8Rj4ZD77fcxHocsXT98Dd5PewKnioP+7cyMIVfmLafBPZx
	MKIFNp+CHLMyhMawyoTjE06xGVO1yIX7XAygV5J7tgnh+BwVlmsYExbz3ht6UFZ1E1NGeRYxRNG
	fJBb6QbXx34jGwU83yKIucqXhJjCOsQSWUbx5n4u50pRoxgCcg58n7s+G0ZrwrNofdG9Z3mPiR+
	7xpeLk5IDp4JFAK4jNduL1HppMUJEEFWz0mCNBMP5jm56WGbwZiR+H18ZQ0U8VxegGndo5fD+RW
	fYl1T9h7fN3HnZNA/rIZVrLuFrV3U+xVVMjSwj0/AGZXIUlMAJFrquzDbdljfBYvvf6o+9th7Nk
	74DLjGyumhRtncayrW61Ah5mw+49T5tXnDAryr6/3OC2fsz+WoaVOXLSnLzJksKRm
X-Received: by 2002:a17:90b:530f:b0:35b:9720:98d0 with SMTP id 98e67ed59e1d1-35bd2c20602mr10397218a91.5.1774248496680;
        Sun, 22 Mar 2026 23:48:16 -0700 (PDT)
X-Received: by 2002:a17:90b:530f:b0:35b:9720:98d0 with SMTP id 98e67ed59e1d1-35bd2c20602mr10397188a91.5.1774248496287;
        Sun, 22 Mar 2026 23:48:16 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd40e4bf2sm8105752a91.11.2026.03.22.23.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 23:48:15 -0700 (PDT)
Message-ID: <dd4990fa-a864-41f3-bf61-7696416b772b@redhat.com>
Date: Mon, 23 Mar 2026 16:47:59 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 17/40] arm_mpam: resctrl: Add resctrl_arch_get_config()
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-18-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-18-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/26 12:45 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> Implement resctrl_arch_get_config() by testing the live configuration for a
> CPOR bitmap. For any other configuration type return the default.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_resctrl.c | 43 ++++++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

