Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F238F9C0
	for <linux-doc@vger.kernel.org>; Sun, 28 Dec 2025 00:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766881121; cv=none; b=BBBqswc5o+n4JMpglgDzG2/CkoT66Yb01T42IspI0STffK/1uh8inWZT+oD9PboumAduU2ljnzFurFYkpQ2fhb04r5Hp0gvvmrPvviRfCTEdMykyPhk7kqg+GgbNWJP2VehuwaExG43RBcdV8XIz7DYKGMQz6IncVsB79+DZaXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766881121; c=relaxed/simple;
	bh=mA4xZkh+IOnROo9dYqtZQB8RfI56qce5+TX4AgzD1wM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PfzxpRhKYwCG73wg3++Rv5LiOcJ1KIpP+UMczE6yuT4rnWzuGgI9Wjlh7LMLRcSdJ0gJKgcINfCOEHyRJkYtXTZk8Tf9GDddnZLWpQHQPABE9ormd1l3j1H2Qp8Vpxdq7rZLvFOfIiX7f0ujooRKoAKfy39u68ehTEpHLXONpHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ngo8rijB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PguR7RVL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ngo8rijB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PguR7RVL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766881118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqR5WHFE7nfIedlDLTwqJJFi0bNQgjEyNOznlTwzMF8=;
	b=Ngo8rijBYCGsJgZgJaCz9qHSr60zJ7mQsZa/yxXzF/CYTvTK+RAzWjkuI4sPh7JhkQU90r
	IUpvJF4WxLinxQrvPSEMYJ/YIEjnYd4vmAjrTjPQyp5EW5Rnzv4oAa5MOWGwmVC/aw/vV4
	PXA7/7FQxuHb17H9ZhLzECg3qxn3dnY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-pL09DumdOguLHuRbIDyr-Q-1; Sat, 27 Dec 2025 19:18:36 -0500
X-MC-Unique: pL09DumdOguLHuRbIDyr-Q-1
X-Mimecast-MFC-AGG-ID: pL09DumdOguLHuRbIDyr-Q_1766881116
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edb6a94873so158402911cf.0
        for <linux-doc@vger.kernel.org>; Sat, 27 Dec 2025 16:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766881116; x=1767485916; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wqR5WHFE7nfIedlDLTwqJJFi0bNQgjEyNOznlTwzMF8=;
        b=PguR7RVLE5JckiN+14NI9GPZQ5Pjjf04DE8514XGXgd1zcZZsVm7QZTUNz8oypV8zg
         o9NHfcS8tHd+XKRZ9C7Ojxk1CiX6o42sPeGOYVSAAgRrFn+jkLDRCIuj/oAAFOL3IY57
         I1xZEcowhLLHMmGhx7pw+IbtDOPgtFhok4/K0J4dLk51BlAtvpjz6bmPkxfeI6tMRYBg
         3X8kW2ctg15yj9Cr5rDlIALHQpkmcHriMaCJQTlld3zkLTD+tGcAZUCaXssD5W5Sqt56
         r/PR848zXW/1W4r1KtjFi200D1bptsKSGjvnMS1+YuG7WJuH3AWcDApT4nlC9r6WJUOF
         IDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766881116; x=1767485916;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wqR5WHFE7nfIedlDLTwqJJFi0bNQgjEyNOznlTwzMF8=;
        b=Lb43SPeuSFVPi6r1mvN0i0unqs32MDZrJRuC/il6WvJGUeJmh5nWmo0cU47whxKoLs
         5SNeFUgkVoi8fro19+pPyZzSX0OZIGchKH45O8N2jpV7CTjogb684FfZxwzHrG9KcUZe
         Va/HFWWC8DsS1wAeCDJwro6D39k/D+O81XUjdSP8fqeh8D+jiLBiglJgkz1BxuPWmK7l
         hsGFKmaJFBs26A6jEMrblN2ih1s//QNyqq06iRQSI8SsWv5tRtyiWfT0wBZbWHNMq2A5
         zW1Yvvpi5Ie6hx5NhAGCfOyc5CfUXr/OgeMEmW4d8vvnILOggrFNx/MsBl6jtgvV8lMa
         1Gxw==
X-Forwarded-Encrypted: i=1; AJvYcCWF5/I+KXyX2M4ysEtTvtxWFL4giM/9vqqr1/EcqYdTqEqS/wrQQdtlEH8ZFQX+oBwt7Cna5UEobbE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTW70vKfMuiqbg8wYtwvwVYrDAsgfiXV89w/5038hGC/vsrw9h
	fshSTwSDOCpfENDoiwS0uN7M2ZIwj2CPpLzYphmBeKpIldn57pYb5s/dtuEnILhVW5sfmVXD/Kd
	SDe4v5CT0XqDqG6Z8OgQJwgvu+zmDzM4P23M5wLqdE8N0tQKOviIHfCQ28pX9oa6AT10tQg==
X-Gm-Gg: AY/fxX6ay1FdAvYufmW0yuVTPTnwgYxnEatu7r1kdaRJ7VVrxG8jmqK3hZbPNHtg8A2
	EPql3aPs7Q4FMsF2MOwcDhTj8eu8pHafpsr3Si0286FMluiwD/Ru1K8T52aNsmNzXsPf0qJK/Tk
	VYruMVYydBDxVT4on4EszUiw2uxm0CiLH4Blt5xtXMO9f1BKdBfUF4r3HGFdlQ39OqD6ZGg96ut
	RakszscvBX5GLhVmTxQKXDQASUU/koadNIxeGJMTgMNp9Tf7omGccRP/Cx3RUvyprZXipn4meYl
	nZMABlzed9I73DxVEz+UZrKYMfexyJmHDerVeNfRg5pD3ZjdjEt7cb93HQdAwk70YIYN20ArDpc
	8mjwKUnQ5Ua4AMBF5J6ZhB1xq3ouWFZjhtLLht6AIWQ+HvtI27Uk=
X-Received: by 2002:ac8:6681:0:b0:4f6:fe06:6cf5 with SMTP id d75a77b69052e-4f81a80489emr7949621cf.28.1766881116252;
        Sat, 27 Dec 2025 16:18:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdcNz3k8Zcw6evwj0qQEpbP+CQXVPF3z7KIXIQn98bZQezQtwjFGuO/GyEM7uNUQswQYVdPw==
X-Received: by 2002:ac8:6681:0:b0:4f6:fe06:6cf5 with SMTP id d75a77b69052e-4f81a80489emr7949451cf.28.1766881115900;
        Sat, 27 Dec 2025 16:18:35 -0800 (PST)
Received: from [10.0.0.82] (97-127-77-149.mpls.qwest.net. [97.127.77.149])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac563f66sm186020801cf.15.2025.12.27.16.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 16:18:35 -0800 (PST)
Message-ID: <1db851cc-f1a8-4de6-a01e-37ec091094ce@redhat.com>
Date: Sat, 27 Dec 2025 18:18:34 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [fs] 51a146e059:
 BUG:kernel_hang_in_boot_stage
From: Eric Sandeen <sandeen@redhat.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <202512230315.1717476b-lkp@intel.com>
 <fb920248-a0fc-432f-926f-c27b1760de58@redhat.com>
Content-Language: en-US
In-Reply-To: <fb920248-a0fc-432f-926f-c27b1760de58@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/26/25 2:01 PM, Eric Sandeen wrote:
> On 12/22/25 8:36 PM, kernel test robot wrote:
>>
>>
>> Hello,
>>
>>
>> we don't have enough knowledge to analyze the connection between the issue and
>> this change. just observed the issue is quite persistent on 51a146e059 and
>> clean on its parent.
> 
> Odd. Not much to go on, and I don't see any obvious connection either, but
> I'll see if i can reproduce.

I can more or less reproduce, I think, though I am not getting the hung task
warning.

Oddly if I just put the 

	struct dentry *(*mount) ...

member back in struct file_system_type it seems to resolve the problem.
Even if I give it a different symbol name (like mount_foo).

I'm confused.

-Eric

