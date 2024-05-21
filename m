Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B983D6A
	for <linux-doc@vger.kernel.org>; Tue, 21 May 2024 00:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716251575; cv=none; b=X88JaIJtzIy+LdUPu1fUgvavpfzVNzVJquwrztDV2P7zvqe4jw3te+WVs025X2VCOw4q7dprawXMSHnOd/B1rdspQWOfcmsiYzb9e6iUF7Bh27fJZxtS/riOJ2k3rAEq83wTNoYUX2szaV5rSYUKtfMPb5Znrz45/WblSplWNi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716251575; c=relaxed/simple;
	bh=fJOiTk/iNpIQGDBT8ov2FCIPhgk6zXZQNw1RaFJJ0Rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L4P9mhIoA9W+sIAWhSl0ajRFWg5BxhiH2zDVhqO1c3oc0R2cotQ306dCirMjTeWHYt3+FrDUdn9JcFP43tRtR+e8oJ+46w6JxJTPCHKK3oRwRWcIRBmB7dwioBopI70E4vMhwnC4+3Al/VurrXD20Lw8c2jYQbneThKAWlpM5FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KTJjHaxp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KTJjHaxp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716251572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wcLWECU84oFD1HOiYc28B9aeY6hAeWxqTdSGNd9MPRM=;
	b=KTJjHaxpFbPcQqOZYhEEY4HQu41jEjBQYn8v2tTNw3YvjtaoT4xWfbOq0ZbuxI5/VvaX0m
	wkTISLfdgRXSF8fSvURpr89UuMVHN8SuRec/DqReCATF139c8hzwpEHayDp/QBa+kMASg7
	1tKVvadZqpdHOW86drWAf3DXV0+T18Y=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-7qzFVwShPeOKS14KX4CBCA-1; Mon, 20 May 2024 20:32:50 -0400
X-MC-Unique: 7qzFVwShPeOKS14KX4CBCA-1
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-5b2bc2bd85dso10155598eaf.2
        for <linux-doc@vger.kernel.org>; Mon, 20 May 2024 17:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716251570; x=1716856370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wcLWECU84oFD1HOiYc28B9aeY6hAeWxqTdSGNd9MPRM=;
        b=fbX6DLRh7k+XUY54SxFtZJZtu374XQApE7Wu0jwjxoVpH9w8aaljOBpfcog+0cBdbz
         EjBJJmLM8abkoUwwhjIKpj1t6Rm9m3SLyv53X6WTe5yHwaAQID8XHTiZ6dhdiu8nBAN0
         29qc7JscQzu6WcpzLLZizTewm9go/xYtYsBi0JnltB0cXYFIM/ed/od8XmpWUfmFXooL
         8YlZId3xPX8YcDCROL9YISWyoAcxUMejiVgTeUfiJ/gzVq0gWT6aj0mndu6F2V0Qy+D6
         d5m0D3IGPuauBwcSXjPCKTm2iAKQqsczFw+Q+LC8eLu9qCrcmTOW2GMDoYwlho7PSzT1
         u2Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVe1m7g8ZYTVLpBDmfDvqHFfQ34ESlMLTX7XOiJwzMSw9cTgitCMdHA4yPkCWGL/SV00UGeE55TZesglD5/Yodp1i7vy9Znw3OH
X-Gm-Message-State: AOJu0YzqwNmW3E9+fiL+6xrNZS096aW4kxb65+wkmyHXvNRjP7fKVqAi
	h5bNm++BH0Djj3DvEOXVKaNCBKxf1k62bOj/q4JKOt0HqfUU8VEsDklKgFLCfEgo2S9WLMCyUIM
	y2zT4heNwd12zgtUU2gpEoUT3C/MtwIdVUGob+bBzzQCGyJeX8PFLHwiKZQ==
X-Received: by 2002:a05:6358:8005:b0:192:75c4:2ee2 with SMTP id e5c5f4694b2df-193bb2dd2d1mr3145967955d.32.1716251569661;
        Mon, 20 May 2024 17:32:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETh+Vbu1JPihq8Oq65XxoXIbGLDFNVTlK2XPdjV3Px478h9iyYRKBexSoEeQC/zYwFYuhl2Q==
X-Received: by 2002:a05:6358:8005:b0:192:75c4:2ee2 with SMTP id e5c5f4694b2df-193bb2dd2d1mr3145966855d.32.1716251569220;
        Mon, 20 May 2024 17:32:49 -0700 (PDT)
Received: from [10.72.116.32] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-660ab682716sm5855077a12.88.2024.05.20.17.32.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 17:32:48 -0700 (PDT)
Message-ID: <5561ff7d-16b3-40e1-b9c4-7327a0dabc05@redhat.com>
Date: Tue, 21 May 2024 08:32:43 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] doc: ceph: update userspace command to get CephFS
 metadata
To: Artem Ikonnikov <artem@datacrunch.io>, linux-doc@vger.kernel.org
Cc: Ilya Dryomov <idryomov@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 ceph-devel@vger.kernel.org
References: <ZkkgZlRk+PbFBUOJ@kurwa>
Content-Language: en-US
From: Xiubo Li <xiubli@redhat.com>
In-Reply-To: <ZkkgZlRk+PbFBUOJ@kurwa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/19/24 05:40, Artem Ikonnikov wrote:
> According to ceph documentation "getfattr -d /some/dir" no longer displays
> the list of all extended attributes. Both CephFS kernel and FUSE clients
> hide this information.
>
> To retrieve the information you have to specify the particular attribute
> name e.g. "getfattr -n ceph.dir.rbytes /some/dir"
>
> Link: https://docs.ceph.com/en/latest/cephfs/quota/
> Signed-off-by: Artem Ikonnikov <artem@datacrunch.io>
> ---
>   Documentation/filesystems/ceph.rst | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/filesystems/ceph.rst b/Documentation/filesystems/ceph.rst
> index 085f309ece60..6d2276a87a5a 100644
> --- a/Documentation/filesystems/ceph.rst
> +++ b/Documentation/filesystems/ceph.rst
> @@ -67,12 +67,15 @@ Snapshot names have two limitations:
>     more than 255 characters, and `<node-id>` takes 13 characters, the long
>     snapshot names can take as much as 255 - 1 - 1 - 13 = 240.
>   
> -Ceph also provides some recursive accounting on directories for nested
> -files and bytes.  That is, a 'getfattr -d foo' on any directory in the
> -system will reveal the total number of nested regular files and
> -subdirectories, and a summation of all nested file sizes.  This makes
> -the identification of large disk space consumers relatively quick, as
> -no 'du' or similar recursive scan of the file system is required.
> +Ceph also provides some recursive accounting on directories for nested files
> +and bytes.  You can run the commands::
> +
> + getfattr -n ceph.dir.rfiles /some/dir
> + getfattr -n ceph.dir.rbytes /some/dir
> +
> +to get the total number of nested files and their combined size, respectively.
> +This makes the identification of large disk space consumers relatively quick,
> +as no 'du' or similar recursive scan of the file system is required.
>   
>   Finally, Ceph also allows quotas to be set on any directory in the system.
>   The quota can restrict the number of bytes or the number of files stored

LGTM.

Reviewed-by: Xiubo Li <xiubli@redhat.com>

