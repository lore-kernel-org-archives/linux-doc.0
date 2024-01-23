Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306A63D7B
	for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 11:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706009582; cv=none; b=CWamVzxjB1/fqw3ZpafwWpnxy9XiJSkN3ZXftfX/vrq2qB4YN9gZG1PF8JJqF8JmDpo8lK5AWho4m7hD/7m4IVKR7bAz+JNU8p61RDJubVsDtynB2tpL/W/AodO/luyg6hkoE5CIYJxgZ45RqyE+wFPMC0nmezYi3tD2zrNZ1Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706009582; c=relaxed/simple;
	bh=kHsgU6bscyUrjUb7FtwfIF1w8ST9mL/+xpptlI8GdGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jfzR6ssekDoQpNaSPu6W5XG3mjZMN4swvU6j/yuvFY61OKuAchvN3VUCa7QuMbxEUSezc4ii4tp/gNS1mwD8TkrTclgRS7KyZg4/Jjjo7rQW76MnTjHAQMF19lXVdL0RUhuBpi4ZGWfjrGHoDtrZzDB8NA4E/cerSekVkzzhJY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=EgCwI9tG; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="EgCwI9tG"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d74dce86f7so16291905ad.2
        for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 03:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1706009580; x=1706614380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7mYCstjuzeJFyThEESOGepvHssD7s2KubrtA/8C1y0=;
        b=EgCwI9tGAlXlMnV2XS2EcsGQjdg45Su4amrKZTTDCVP0QusQc39wGMKaoq2wyywlAQ
         whVfLqmO+b+iNulVWDonMFP7yzwou8yKof5dA0jKWPmggYcrAF7tw7+YILHw+XNO7Zny
         7IlYs60UfdIGvKF/wquQrCF1NutxG82JdCXzLA8NQomi+pUN9x0ewp4e7UFVj31RFWeS
         L0jSLeRPNAVjMypdTyqZ4EeksnUVpo3MVhaO/iTrmsdjWdb0cuIH/unDi5OHLELwggWS
         mX0ubbmYkSP+b+jsLGtmdj4MIk+TmeQ9Q3aOH2w1b+JfxZattKJRrlYMecWw3DvqOOzW
         unQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706009580; x=1706614380;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B7mYCstjuzeJFyThEESOGepvHssD7s2KubrtA/8C1y0=;
        b=oJiv9H3QIbfJVOxoQZBzsvIMuOlAzXk+yX2EFU6Viqmme5cxHqcmkaQ7VWZaaQgY4M
         OY3GxwfZDJfKYlyhHkCxvpUZoLblMDBM1ICKkmYlMpTrOvxl/XsVvj4Pre59O1wsk2wi
         QyY3xC6jkMCjJQAJCA5V59N3+XnE/acZSxi9rDlxVVcG6Mi/2tPNmfIol4SwEog5z5z6
         W+THEKuJf6jhgHSrktNTibZxW1C2sIJRSTGLiYS4GNd24CSRRAztn9Evq9voq5YnRmf2
         pgQN8FLDq9y6SbQU5BjVyCB9AS/LBD2TtIL30NbkRTvmh+JYCxCVDjBhtqVKUMhYdm54
         Xqvw==
X-Gm-Message-State: AOJu0Yy7+8ALlSBFDDEgPwHvskJ0hlyKGve5STFXOHC7vuwIKOIynRP0
	VrW3lgSyxhnysX8ztnyJjgVj0a8FCso8yXd7PfynMF3fDq5bvLlLH3CRz0elVHs=
X-Google-Smtp-Source: AGHT+IFZ0zQevKm4TZtkpESRMhB2+YohXNP3CsxOxjdJVikF9/pOpVnNhDK8DLOpXDycffK+4d4ZDA==
X-Received: by 2002:a17:903:2282:b0:1d7:4873:e789 with SMTP id b2-20020a170903228200b001d74873e789mr4581431plh.24.1706009580347;
        Tue, 23 Jan 2024 03:33:00 -0800 (PST)
Received: from [10.84.143.118] ([203.208.167.154])
        by smtp.gmail.com with ESMTPSA id ky11-20020a170902f98b00b001d76ced199esm1086953plb.31.2024.01.23.03.32.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 03:33:00 -0800 (PST)
Message-ID: <2abcc398-1cb1-5099-f796-ad69534d1d1e@bytedance.com>
Date: Tue, 23 Jan 2024 19:32:55 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [External] Re:[PATCH v3 00/19] arm64 kernel text replication
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>, rmk+kernel@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
References: <20240123103509.696983-1-wangyuquan1236@phytium.com.cn>
From: Hao Jia <jiahao.os@bytedance.com>
In-Reply-To: <20240123103509.696983-1-wangyuquan1236@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024/1/23 Yuquan Wang wrote:
>>
>> After applying these patches, we tested that our business performance
>> increased by more than 5% and the NUMA node memory bandwidth was more
>> balanced.
>>
> 
> I have successfully applied your patches on my arm64 linux. And I could
> start it with a qemu machine(virt). However, I don't know the way to test
> the performance it brings to the kernel. Do you have some suggestions?
> 

Kernel text replication performance test results depend on your 
workload. Different workloads will behave differently.And performance 
testing in a virtual machine is not very accurate.


Thanks,
Hao
