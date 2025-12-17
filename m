Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B6333DEC5
	for <linux-doc@vger.kernel.org>; Wed, 17 Dec 2025 17:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765990923; cv=none; b=OCtheoyd46aExuDcj4hxHm6YE4OAvi5KGQxBjSI3sqlposf36hVeDaQN+4OWAmleTGiY7dLsccXoYPI6CReX//rdOe/y88I22GMNKwUYkUVjOnTLJxH2BNbSoZc7l/pM9yqjnEXjEsD3H3UW0q3zSmac7KOh+7ekmiscp/w9LRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765990923; c=relaxed/simple;
	bh=2D02SqJKD+nsCsJr8M1rCApsCcKMVZUyPH+0iU3i6ZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iDZaim+DpAimaZjqI835UGljVmQ1c0sb/Hqem2JCS0IuJrgR/0pX1gmN5fUdrXBvTuIElAWg1IGJ3WgBhjCcy9leh+aALeW4eCB9Yx2iTvUWSjJOptnO5eytlDP2pnTC4S2zKZafgqEo2P/9us/wQ+qBxEzhIBliqilIcXJ9c+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gGcOlAGJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KfWGWoVB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gGcOlAGJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KfWGWoVB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765990918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dD5nFNFh+CHq/nzULmKKE12yIQGGBSkgJsl56ofghHQ=;
	b=gGcOlAGJwHpEufnbC8FoBzTXbvnBg8tlEWLPOTIHb6Hwfi5bSnOk1R70vASPalhrH8ldbK
	PAtwreueK7tsZ1Ksr4z23xfFDX4mvg3tVR5og0muYsgZZQ0nLxfXWRtOVY7Q7AII3YjwJx
	i3kTXe14wekGY92+sjy7IPZ0tj+KJJw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-a40UgiztMdGa5DZWQHSCFg-1; Wed, 17 Dec 2025 12:01:53 -0500
X-MC-Unique: a40UgiztMdGa5DZWQHSCFg-1
X-Mimecast-MFC-AGG-ID: a40UgiztMdGa5DZWQHSCFg_1765990912
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-42fb1c2c403so4787759f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 17 Dec 2025 09:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765990911; x=1766595711; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dD5nFNFh+CHq/nzULmKKE12yIQGGBSkgJsl56ofghHQ=;
        b=KfWGWoVB/l6mxGUtQdYJe6v0cGKG6MK4aIQ45f5K4IPOpgUkWjKS5X7i4dZgAg+fPi
         +QhOK3g56CelitpLkjJ4o77TeDMC9OoT5AExk9Iq3SL2XUAxZLCtB2xQbi2wPjVNZeFq
         VPA4UnXxe6s7uB4qiV2SUPoPIRmYgcJYTp1xS9NyHhI2ql0oyQRFxUEF6+QTETg0akif
         5qTKrt7DywoVakjGzvhSFMpgLqiUacbdk1eX6loJbrfqhfFVTf74j872IUymPYcoO3On
         vKAi8kWiPDcPjT5oKxfuc+V+BC0Dl0wKz3s9zLGYJyTaxQILAF8UgHwTOLvrvLvivk6o
         xZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765990911; x=1766595711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dD5nFNFh+CHq/nzULmKKE12yIQGGBSkgJsl56ofghHQ=;
        b=ujLBtlcmK4qfL6Nd9kAN6NXDe/GOcb6qPMfqlE1ivF9rAEp8f+9+dnAvgqdb07nA+B
         qS9VIkEj5ANs8phDzsoIOsMmZML9YiqbWKkW10qP8O6U+OBIf8sAgLub1FCC76nLv8jo
         PCcf7m36koFp0Ky7YTqHdzk6mNNSIKVkB8bJ7KMc6JJBpPrauci2E6PoQo6L5uX+/YQ4
         K/DV73ZNjbTDvTnOgfwh4gDDihbW4HeJW5kI1+7WEHUNdgwpnTa77jqGRWARa/8lCGY5
         Id0Up9+XMvPiSHnPDRGOJI/4iw8X7ipiOtNiVuyVsqfa61NRQr6FfJVXsCy6MdGi5LCz
         mbpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSI33kRLbB3+wxtI3apgKoH+2m9CJmH8C80PRdqhCfMsRiQ1kSXZn1KxJeRMVl5lyo7/eC/M7oJdc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc40TjIuv5GuY1RlW0R0VtcLQXg1dU2DgmPqj2E8/7JMZSlPDl
	tsH769/Ukz5HHzsS+4clKXZGGbd2xVW7ZJbJpWSSfm86gOrFqxNfF4rClidmoMvSEYJ7Gsd3DIC
	ZWPnkk2+ANEqluWffi9MR4ufGbv9eCxYcT5H8leP4CM91IUe21osNHPXJEEI9dQ==
X-Gm-Gg: AY/fxX7Nu1nGN49akJhshXVY0bVB4Dt8+z7wNhT6cDw50l/Us7UuzBJ4p1DzsctDA8c
	hLd6YZSoDiDz8qqtwMDDNbygtFID7g+6+BtJnF9mTKx9+NSvfK489F0tFEJ3TdvfiInfPNPqX66
	RjaaUFdVDBE5CLr8aV5kx0RH6ViS5V8R63jWm31Jxkm5XNVwUtEj4evnNWfE+0fmPbnoBl82N8/
	aylOu0GYgo6RjmIBAU6jwDe+nHqF8d+qumKIUK/OjcjNkeLxQ2HHIWRFVOJUvht3nlO2gC8MA0L
	hYnGdcL4awt55+bmfPlat0bYE9E/LYC6uRDnj6qePsc2sL76FkdbbMyjy4ziQnYmVbnPHXUpL0h
	WZhbIJ701NGoSPVfMVlUDPVq5aoJYeUUKqorxxbuE75rr+IVG
X-Received: by 2002:a5d:64e6:0:b0:430:f5c3:39fe with SMTP id ffacd0b85a97d-430f5c33c72mr16059993f8f.4.1765990911449;
        Wed, 17 Dec 2025 09:01:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7naa2xfBN81UFldN7VJ60YMv46kr3qq+t2tP1xJU0lrdjUCzUiNloJ8sGrQh5v79JlM1s8w==
X-Received: by 2002:a5d:64e6:0:b0:430:f5c3:39fe with SMTP id ffacd0b85a97d-430f5c33c72mr16059928f8f.4.1765990910912;
        Wed, 17 Dec 2025 09:01:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c? ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43244949ba6sm34714f8f.19.2025.12.17.09.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 09:01:50 -0800 (PST)
Message-ID: <9d06837d-7aed-43ef-87c2-1ce4f921dff2@redhat.com>
Date: Wed, 17 Dec 2025 18:01:48 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/11] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
To: Nicolin Chen <nicolinc@nvidia.com>, Leon Romanovsky <leon@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe
 <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Williamson <alex.williamson@redhat.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Krishnakant Jaju <kjaju@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 iommu@lists.linux.dev, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org, Vivek Kasireddy <vivek.kasireddy@intel.com>
References: <20251102-dmabuf-vfio-v6-0-d773cff0db9f@nvidia.com>
 <aQpRz74RurfhZK15@Asurada-Nvidia>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 xsFNBFu8o3UBEADP+oJVJaWm5vzZa/iLgpBAuzxSmNYhURZH+guITvSySk30YWfLYGBWQgeo
 8NzNXBY3cH7JX3/a0jzmhDc0U61qFxVgrPqs1PQOjp7yRSFuDAnjtRqNvWkvlnRWLFq4+U5t
 yzYe4SFMjFb6Oc0xkQmaK2flmiJNnnxPttYwKBPd98WfXMmjwAv7QfwW+OL3VlTPADgzkcqj
 53bfZ4VblAQrq6Ctbtu7JuUGAxSIL3XqeQlAwwLTfFGrmpY7MroE7n9Rl+hy/kuIrb/TO8n0
 ZxYXvvhT7OmRKvbYuc5Jze6o7op/bJHlufY+AquYQ4dPxjPPVUT/DLiUYJ3oVBWFYNbzfOrV
 RxEwNuRbycttMiZWxgflsQoHF06q/2l4ttS3zsV4TDZudMq0TbCH/uJFPFsbHUN91qwwaN/+
 gy1j7o6aWMz+Ib3O9dK2M/j/O/Ube95mdCqN4N/uSnDlca3YDEWrV9jO1mUS/ndOkjxa34ia
 70FjwiSQAsyIwqbRO3CGmiOJqDa9qNvd2TJgAaS2WCw/TlBALjVQ7AyoPEoBPj31K74Wc4GS
 Rm+FSch32ei61yFu6ACdZ12i5Edt+To+hkElzjt6db/UgRUeKfzlMB7PodK7o8NBD8outJGS
 tsL2GRX24QvvBuusJdMiLGpNz3uqyqwzC5w0Fd34E6G94806fwARAQABzSJDw6lkcmljIExl
 IEdvYXRlciA8Y2xnQHJlZGhhdC5jb20+wsGRBBMBCAA7FiEEoPZlSPBIlev+awtgUaNDx8/7
 7KEFAmTLlVECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQUaNDx8/77KG0eg//
 S0zIzTcxkrwJ/9XgdcvVTnXLVF9V4/tZPfB7sCp8rpDCEseU6O0TkOVFoGWM39sEMiQBSvyY
 lHrP7p7E/JYQNNLh441MfaX8RJ5Ul3btluLapm8oHp/vbHKV2IhLcpNCfAqaQKdfk8yazYhh
 EdxTBlzxPcu+78uE5fF4wusmtutK0JG0sAgq0mHFZX7qKG6LIbdLdaQalZ8CCFMKUhLptW71
 xe+aNrn7hScBoOj2kTDRgf9CE7svmjGToJzUxgeh9mIkxAxTu7XU+8lmL28j2L5uNuDOq9vl
 hM30OT+pfHmyPLtLK8+GXfFDxjea5hZLF+2yolE/ATQFt9AmOmXC+YayrcO2ZvdnKExZS1o8
 VUKpZgRnkwMUUReaF/mTauRQGLuS4lDcI4DrARPyLGNbvYlpmJWnGRWCDguQ/LBPpbG7djoy
 k3NlvoeA757c4DgCzggViqLm0Bae320qEc6z9o0X0ePqSU2f7vcuWN49Uhox5kM5L86DzjEQ
 RHXndoJkeL8LmHx8DM+kx4aZt0zVfCHwmKTkSTQoAQakLpLte7tWXIio9ZKhUGPv/eHxXEoS
 0rOOAZ6np1U/xNR82QbF9qr9TrTVI3GtVe7Vxmff+qoSAxJiZQCo5kt0YlWwti2fFI4xvkOi
 V7lyhOA3+/3oRKpZYQ86Frlo61HU3r6d9wzOwU0EW7yjdQEQALyDNNMw/08/fsyWEWjfqVhW
 pOOrX2h+z4q0lOHkjxi/FRIRLfXeZjFfNQNLSoL8j1y2rQOs1j1g+NV3K5hrZYYcMs0xhmrZ
 KXAHjjDx7FW3sG3jcGjFW5Xk4olTrZwFsZVUcP8XZlArLmkAX3UyrrXEWPSBJCXxDIW1hzwp
 bV/nVbo/K9XBptT/wPd+RPiOTIIRptjypGY+S23HYBDND3mtfTz/uY0Jytaio9GETj+fFis6
 TxFjjbZNUxKpwftu/4RimZ7qL+uM1rG1lLWc9SPtFxRQ8uLvLOUFB1AqHixBcx7LIXSKZEFU
 CSLB2AE4wXQkJbApye48qnZ09zc929df5gU6hjgqV9Gk1rIfHxvTsYltA1jWalySEScmr0iS
 YBZjw8Nbd7SxeomAxzBv2l1Fk8fPzR7M616dtb3Z3HLjyvwAwxtfGD7VnvINPbzyibbe9c6g
 LxYCr23c2Ry0UfFXh6UKD83d5ybqnXrEJ5n/t1+TLGCYGzF2erVYGkQrReJe8Mld3iGVldB7
 JhuAU1+d88NS3aBpNF6TbGXqlXGF6Yua6n1cOY2Yb4lO/mDKgjXd3aviqlwVlodC8AwI0Sdu
 jWryzL5/AGEU2sIDQCHuv1QgzmKwhE58d475KdVX/3Vt5I9kTXpvEpfW18TjlFkdHGESM/Jx
 IqVsqvhAJkalABEBAAHCwV8EGAECAAkFAlu8o3UCGwwACgkQUaNDx8/77KEhwg//WqVopd5k
 8hQb9VVdk6RQOCTfo6wHhEqgjbXQGlaxKHoXywEQBi8eULbeMQf5l4+tHJWBxswQ93IHBQjK
 yKyNr4FXseUI5O20XVNYDJZUrhA4yn0e/Af0IX25d94HXQ5sMTWr1qlSK6Zu79lbH3R57w9j
 hQm9emQEp785ui3A5U2Lqp6nWYWXz0eUZ0Tad2zC71Gg9VazU9MXyWn749s0nXbVLcLS0yop
 s302Gf3ZmtgfXTX/W+M25hiVRRKCH88yr6it+OMJBUndQVAA/fE9hYom6t/zqA248j0QAV/p
 LHH3hSirE1mv+7jpQnhMvatrwUpeXrOiEw1nHzWCqOJUZ4SY+HmGFW0YirWV2mYKoaGO2YBU
 wYF7O9TI3GEEgRMBIRT98fHa0NPwtlTktVISl73LpgVscdW8yg9Gc82oe8FzU1uHjU8b10lU
 XOMHpqDDEV9//r4ZhkKZ9C4O+YZcTFu+mvAY3GlqivBNkmYsHYSlFsbxc37E1HpTEaSWsGfA
 HQoPn9qrDJgsgcbBVc1gkUT6hnxShKPp4PlsZVMNjvPAnr5TEBgHkk54HQRhhwcYv1T2QumQ
 izDiU6iOrUzBThaMhZO3i927SG2DwWDVzZltKrCMD1aMPvb3NU8FOYRhNmIFR3fcalYr+9gD
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <aQpRz74RurfhZK15@Asurada-Nvidia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Nicolin,

On 11/4/25 20:19, Nicolin Chen wrote:
> On Sun, Nov 02, 2025 at 10:00:48AM +0200, Leon Romanovsky wrote:
>> Changelog:
>> v6:
>>   * Fixed wrong error check from pcim_p2pdma_init().
>>   * Documented pcim_p2pdma_provider() function.
>>   * Improved commit messages.
>>   * Added VFIO DMA-BUF selftest.
>>   * Added __counted_by(nr_ranges) annotation to struct vfio_device_feature_dma_buf.
>>   * Fixed error unwind when dma_buf_fd() fails.
>>   * Document latest changes to p2pmem.
>>   * Removed EXPORT_SYMBOL_GPL from pci_p2pdma_map_type.
>>   * Moved DMA mapping logic to DMA-BUF.
>>   * Removed types patch to avoid dependencies between subsystems.
>>   * Moved vfio_pci_dma_buf_move() in err_undo block.
>>   * Added nvgrace patch.
> 
> I have verified this v6 using Jason's iommufd dmabuf branch:
> https://github.com/jgunthorpe/linux/commits/iommufd_dmabuf/
> 
> by drafting a QEMU patch on top of Shameer's vSMMU v5 series:
> https://github.com/nicolinc/qemu/commits/wip/iommufd_dmabuf/
> 
> with that, I see GPU BAR memory be correctly fetched in the QEMU:
> vfio_region_dmabuf Device 0009:01:00.0, region "0009:01:00.0 BAR 0", offset: 0x0, size: 0x1000000
> vfio_region_dmabuf Device 0009:01:00.0, region "0009:01:00.0 BAR 2", offset: 0x0, size: 0x44f00000
> vfio_region_dmabuf Device 0009:01:00.0, region "0009:01:00.0 BAR 4", offset: 0x0, size: 0x17a0000000
> 
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>

Do you plan to provide P2P support with IOMMUFD for QEMU ?

Thanks,

C.

