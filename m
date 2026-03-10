Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844AC333727
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 10:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773139317; cv=none; b=rSkHKllumRqBNguZqaO8na/Ls+2CDn9tNhfB7u6OMBHrP4/aiEi1th5UZrGk0W5cDAKA3nwGl+8Jzx36AdheMXc68AEc/2sSasQaFNVbcviVIwFGrykimmMktV3lvKK1HXb7hUo7CkEP4nmZG9+IaXfSK40vcHKnZSHO1ZjtG04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773139317; c=relaxed/simple;
	bh=QA1KxxMMSDcF1osqCY7OifS10a0/MyqaHCxWf/Q2srg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=lCQu1rYnIBHAxRZP0n8h8PLbYppFNR8UwvJBUi8PripZnN6W5/Dk1vSDlg5og7GNE1sBdfPyv335YCdc719vbf+TItKYUCytQhoNXhoKXU210LhCw76iP1DG2OqFeZl3tCUhKlO16NJt5p3vcZpRkvDG7CLEzJf0F/87711iENc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbi97rGZ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbi97rGZ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2adbfab4501so56711675ad.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 03:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773139315; x=1773744115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frBGuYI2ZRQ70uJZPkAOGdR6b+Ml9G7t7E4rd2AiaK4=;
        b=nbi97rGZ8xGr9oDZAFKH8CAwptGH0DwNIjnF/Pv6pVDdv1HHBQDfQUT9zOTuicFx+E
         8wqKRk7tjcoUDPsN9eyA6VCZQZrZNSaATRnoG96r1IJKW9jnta5S6z+8/BVxiNQ75FmQ
         iSY1PSXNNoQwS2r7r1YzZJFb11BCZ2Mo8eKe+rdWUp5rHnlKt5CI2bB+/uhNyvBVL2eZ
         /GJPkHPx79oRYGl/SYj3QdvU+WP36oAO21iHPJIKm0YGEoQl7yeTAYGYNLHO8g/MOphS
         +wk3TUXoPGBA+0aOkSkAC63FoLOR3ij0QGFYB506HfPPKXAaDgxvSGl1tef7Nm74HJ7e
         KrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773139315; x=1773744115;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=frBGuYI2ZRQ70uJZPkAOGdR6b+Ml9G7t7E4rd2AiaK4=;
        b=bEJCEVYXzMZJtx9Dshm5ykQgaVNTUHN+oQR3pdIWs9YXO+fc8xz5PSgKjFr8TKLfWK
         1KcMK+SBeJY0305crZg/lKEqFPpcQ7R12j3uGJe/G/n1KVWL6gjb4apPgQMAigvCWlKp
         S0kjENbiFKeklI/8ceLSiAcQv7ABgxh1pSHh94LnfT9j4pHXdy3Cv3Eq8n/r3H7RGKn7
         lN1v2sk3uRT+eXX2w6HhCfaO2Qt/EuFsj4ckhm8NXnsQ+/BBSG2spzMgDtu/WQ/SQyUI
         wsWudXDGPcSwFcQ9OU1GRX8zqgs45YkJ0+Knf2tVtk7VDJz5/PfwL1lVtLfKqVJ1CD0n
         brQA==
X-Gm-Message-State: AOJu0YzIke5p8UVwXZQD7BnBOgfZoo9q7IswSt3ME47x1mjbaTSwDRP3
	6rvpxbSLfnj0NYQQ7bjPjisScIpOK1BB6q8Cg3177RCaq4QFW6PUCwiEZHtPaA==
X-Gm-Gg: ATEYQzxnvbvbCD9TfU4sT/avBHrIrJj3YUjKaenpEVC3/ISDKpeifAkgxz6lryUdhl4
	HcztAjMjNWMzh1wFXdbWs2BRsDORn7t1+nwksJhoqJfZZsSBW1h4fp0oeXUWtU9EgjuFBKX7Vq3
	cIl/RdBZDLIwCV1SkOoWBrqCsSpFfyN3CNkcmhWpM3pVTBirGo3fGSbQQ9At8AeedgLCdTFDBYb
	q1u2OY43MBSjFslGigKRtMpmutrv0UcAO1CiKLwwEYtuDI+hiJRJTYuxPNm+YsP0z06rcT2QgHR
	IbkD4qQBGyodm84YhsL7vtWxegmqggcAQ1Rl3TOtyaZaMXqBvHGXmVwCXV+tMbjSpRGBIGxSR8C
	KhOIi6naOcnjc6hnm6xy2IvM4b0WtCZWltjm9826KLYmn/EqhamiETbxTl1AkRMqCcw8Ojx9lf0
	cJmIjeHY/2ifuhA+T+UqcVDk3Kyn/9HcRVmYYBfpI4rZhOiTm/yJQyAVhBIlv0yi41Bckf
X-Received: by 2002:a17:903:2ece:b0:2ae:481a:360c with SMTP id d9443c01a7336-2ae8249d900mr133332465ad.54.1773139314873;
        Tue, 10 Mar 2026 03:41:54 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840adb42sm196676345ad.81.2026.03.10.03.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 03:41:54 -0700 (PDT)
Message-ID: <793c8771-83ab-4e6b-811d-41fd54b78e3a@gmail.com>
Date: Tue, 10 Mar 2026 19:41:53 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: julia.lawall@inria.fr
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org
References: <7db99952-d1ef-7148-4c8f-1e6ae8f0d875@inria.fr>
Subject: Re: [cocci] [PATCH] coccinelle: update Coccinelle URL
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <7db99952-d1ef-7148-4c8f-1e6ae8f0d875@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[removed most CCs]

Hi Julia,

> On Tue, 10 Mar 2026, Julia Lawall wrote:
> 
>> The LIP6 URL no longer functions.
>>
>> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>>
>> ---
>>
>> I used the UTF-8 encoding for the email.
>> Let me know if this was not the right choice.
> 
> OK, this doesn't look good.  Sorry for the noise.  What is the proper
> encoding?

Encoding itself looks good, but your patch has this in its header:

    MIME-Version: 1.0
    Content-Type: text/plain; charset=y
    Content-Transfer-Encoding: 8bit

, which should look like:

    MIME-Version: 1.0
    Content-Type: text/plain; charset=UTF-8
    Content-Transfer-Encoding: 8bit

Didn't you say "y" to git-send-email's prompt of ...[UTF-8] ?

Thanks, Akira

> 
> thanks,
> julia
