Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624727;
	b=StdFhZ8XFr6quNPmy73QCQY8b15ul0nm2uskeHnFDwcSR+AxraBf3b1i+dILf9AfYNva
	 P0vE7Irix01jNNCXuV9UrSjiTKxEqHq5/7BLDgAd1XWXoqYOR7VDbJ/HN/+8XY1Kn3Y1Y
	 gr9Uxjg8hWcOfTgiBIjTF8DfN54/uYiYxsGgPYpD17MTqmOSLI03UC3bM8cYmBqNWrP6A
	 8Y7uZBXbcX1xMkZ3dLYCIJQ71fbYRnokbdda6DkEbSHyugrXKiRQ5d8Z6KIlskWx1ksv/
	 c/G7P4tRIJVR2Z5qbVcpbtUX5kQ3t58C7NLpeKJuPMQ+96kVytnfESNt2Dm803t286w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624727;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=c1S+s22mzATJCTCCL5DTXHxYL44AP7LTE1ouMin7MxA=;
	b=WlwlHlpkRcMsRG5GevURYB7ovYg6zgwVzGDoIFhY07KWTJ3L7Z9MjLbFS/ly8UVc8ppV
	 5mWMCbPISebe9eOBPo3qbBbx+NgMQ9cjH+hEYjJ2ZbqlMlET6mIBFdvkT1lGygDDRL5nG
	 WwJOm/qAoQqYZIt+pxg2JJfYJT/1yk2xX6UqBZzgjyFlTjms4lwBjRFfh38sEyRbD9d9R
	 SO+5t8UwnIXeTwm7l/DDmnLFRrPRARVBg9dRBYHa8Fh+59fwBHQEngCzxHs8kAZ0PrHkJ
	 8ZN0Psnnd2EzxJ/p/Osp3HQqgtj+3/qAGjcj6tZvQjKw8pRWDAxDEmnSgtWbMa/VRZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=ahJGAWac;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BD5606A33C;
	Wed, 25 Nov 2026 16:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25BD5606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=ahJGAWac
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 57C31410D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1795624726; bh=c1S+s22mzATJCTCCL5DTXHxYL44AP7LTE1ouMin7MxA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ahJGAWacWI0LFUGOaFd3KgTS6CLTAsQSrwKIrK/wfW0l6o1e+IdGSxueBPXrEptPD
	 Am6weIgBDpeCJi+SSX3eIqh5MfE9BlZBCyNkCgYjn1sT01nx2kKQpDoqXNV0GCxfUj
	 JXntC9xAmxIrTjmbfgyldr8fhfVf6FjKOPzTNEDqzKNQtSjd2TFd3ByckXFYSoVvD8
	 N46O0inKx3ROYcHa/76xmJw/B321KD/cGjpK8yg3rJsSIcI2Qi6V1qHHszjWID1RGU
	 Q4lm/fmUou3RBxw3gfKHZ02Vga5mKw8dXl6PFWBpiM7k4aM4deeozecO6VzQhO4Le+
	 8KhtTyZ6kGcEw==
Received: from localhost (unknown [205.220.129.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 57C31410D3;
	Wed, 25 Nov 2026 16:38:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Codella <mauro.codella@pm.me>
Cc: Mauro Codella <mauro.codella@pm.me>, skhan@linuxfoundation.org,
 rdunlap@infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: sysfs: Align example callback names with __ATTR_RW
In-Reply-To: <20261109204724.37838-1-mauro.codella@pm.me>
References: <20261109204724.37838-1-mauro.codella@pm.me>
Date: Wed, 25 Nov 2026 09:38:38 -0700
Message-ID: <87ecc8x3w1.fsf@trenco.lwn.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Mauro Codella <mauro.codella@pm.me> writes:

> The sysfs guide presents __ATTR_RW(foo) as a shorthand for the preceding
> DEVICE_ATTR declaration and explicit struct device_attribute initializer.
> Both preceding examples use show_foo and store_foo, but __ATTR_RW(_name)
> uses token pasting with _name##_show and _name##_store, so __ATTR_RW(foo)
> references foo_show and foo_store instead. Switching to the shorthand
> without renaming the callbacks would fail to compile.
>
> Rename the callbacks in both preceding examples to foo_show and foo_store
> so all three examples agree. No kernel behavior is changed.
>
> Codex identified the mismatch and assisted with the change and commit
> message after a request to find a small kernel contribution.
>
> Fixes: 44a47f0e3ec2 ("sysfs.txt: add note on available attribute macros")
> Signed-off-by: Mauro Codella <mauro.codella@pm.me>
> ---
>  Documentation/filesystems/sysfs.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

jon
