Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A8B336881
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 14:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469369; cv=none; b=joxZnYA4DIt2XBNgbq57QCoQmRIHxf9MQqM07P/mI6xYwTzrA8SDliEd1tBTCkljruj0tq8y5fN2muEuensoKo9jP4T+gd6VVaaQEnsuQplaxrYRl60XCDCvJpuBvx2BDFzfVeORgm9E0BvXiAK7CtUW7H7OE68D0odpf8z/Mno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469369; c=relaxed/simple;
	bh=bGvHf/Eu0Cr1bzhWZCCr+lmOp/ko/TJ9QQPm2D6QGx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNVM7x/ZC8a/FmRLoobi003kYgdU8cCzKUvirMcUTNI7H4uJBtMr6xk7MCvIsUCM9kP1d9Dhqr0oYqsRslA8bLsxbCUaEc/fA/RkCIRhxcSdQ5EFQteOQHEaqYa+9PzOl7adR2O0b5JIumfyveQz/3kYNYmvO/4S7l+owocqG+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Neph803H; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Neph803H"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92f0b5ed131so361211985a.3
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 07:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791469367; x=1792074167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Bk5WdlTS5GWj3gecV1hQkLvdo5DtdQs/OHFj/sJG40=;
        b=Neph803HWrMHjnSfIlJKSQiDcfOIhPBVL/2YxFQKuQDFvoFxoPiL2g3NXcePc6+Xw1
         BW/iilGXZo3aSQcQ0St4YKCRtkdR2nol+lBnswCo5S9Xkt1xfjJcasElcwp8zf2MTM3N
         rqm7PuIB6OOo0KI9WKSlNo9oU6aVB6CvA7BiwfzO+6Ira810kIn2O0XjAiHY9llHDugY
         2Kv9eyKRzJIcGkABtBov7b2DBZ/tXIdJLme0q9Zl8wkX/5DV0pQcvl1AWlUIWi0ys+gD
         sX/X3ExCEiVCdonoDhJipRNsfCXaomLJduJiS3lEMASMDzZd0JTC2sWtmsM3FZtdQpwe
         sZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469367; x=1792074167;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Bk5WdlTS5GWj3gecV1hQkLvdo5DtdQs/OHFj/sJG40=;
        b=BvqEINGNgni2VLzmHns38eZgVwAPB2GUj+LJ01j8k9Aa3hLB4svUl6uzGQ8VBkGjPL
         ADEDPu/LOnX3nXBFVpBRCGNUCVlKEjPX5nIwvnxUgrKI5GyqiSHOGjLNMjAJR9B85W1T
         cvOD1vcZqn6vJ9+ueNqkjRB/+d12eIrZ4YoTHSgMXN1eBzw9Mf8UVugAuCRIRcFARW/i
         I3aYgwoaAjuDOD07C6v6xfXaDx6jgGq/YrqwzeM5JG8YOJC+swC+l3WbLEcV9/BCRcbZ
         72ju+B70K6n/4iGjOVZ7dO+6irRGaCmwcp2/VHvj8zi9tmrDn54uBZKzXExVmSDA3JXi
         lNRA==
X-Gm-Message-State: AFuF++kLzHvGqvjg1cTGuBYixXKX8ZnUlkKn6ElogehMTxPB8vtQEU0s
	Wtsu9vcQ0criVKJdCKiI0eH2aFUWzlW+ESi9O+jt5ayYWxXU8IuStm6LkipaJ1e24SCynWWyn+4
	Ly0ybxA==
X-Gm-Gg: AYBFou3cro81jQqVjNMpt+0eWoqTnuEk99FZ6lbms3iQFDN2AS83OdIlEBNFBHw6MMg
	SQGTEvDYSffM1LLpW7f0PLRQS1h+tg3jMd3RnNaNxXqT2jciM87+c39CuqPVF/EaQSG729to54C
	WYREHja/ey2qsaSq3j/bw+kJgsR8mVpDH7gnlHfw/726ZCkZpgQhhc/i9Z4GQJQW6O7rZBcfDoA
	i0tq/nfRn4BQ0PQT9q1Ip0BxDr6iBuDXuOUxgEPHPTgCFASl1BAg6qRUPQ23sVZ8kyYz6NEO88R
	7W8h/Pmifqy50MAEqfM7S63eAIhnLg6vLmZIcQ5fTDlv6lqowxNizr2Pr/dhasR6qi0CaNKAws1
	eRv327ZsXDSk7uSDI4B1VCDuU33TDBS8ZnLcUey6dBsiSR8dK5dKBD0LkURRGlkvpiRKyTIMbet
	MXG6viJLlhKoBBflHkjKI4n/9KHtKiWUgHbfTAWz8QII+95BZhMkTUtIPCbvwl5h5dvaiRNzzeu
	76TK4b90BM7ppS48YeJ+NEHM+k=
X-Received: by 2002:a05:620a:1992:b0:93e:9807:9784 with SMTP id af79cd13be357-93e9b8201b3mr1007726285a.69.1791469365187;
        Thu, 08 Oct 2026 07:22:45 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e991580d2sm488539785a.21.2026.10.08.07.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:22:44 -0700 (PDT)
Date: Thu, 8 Oct 2026 10:22:42 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>, Zuo An <zuoan.penguin@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: ABI: sysfs-bus-usb: fix typo in path to interface
 file
Message-ID: <45fffbff-1653-45c5-8e24-d5a580faf5aa@rowland.harvard.edu>
References: <aseApS_MWoP3Jtp0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aseApS_MWoP3Jtp0@gmail.com>

On Thu, Oct 08, 2026 at 11:38:13AM +0000, Zuo An wrote:
> A path was misspelt with the delimiter between the USB <config num> and
> <interface num> as "-", when it should be ".".
> 
> Signed-off-by: Zuo An <zuoan.penguin@gmail.com>
> ---
>  Documentation/ABI/stable/sysfs-bus-usb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/stable/sysfs-bus-usb b/Documentation/ABI/stable/sysfs-bus-usb
> index cad4bc232520..400237db166d 100644
> --- a/Documentation/ABI/stable/sysfs-bus-usb
> +++ b/Documentation/ABI/stable/sysfs-bus-usb
> @@ -60,7 +60,7 @@ Users:
>  		PowerTOP <powertop@lists.01.org>
>  		https://01.org/powertop/
>  
> -What:		/sys/bus/usb/devices/<busnum>-<port[.port]>...:<config num>-<interface num>/supports_autosuspend
> +What:		/sys/bus/usb/devices/<busnum>-<port[.port]>...:<config num>.<interface num>/supports_autosuspend
>  Date:		January 2008
>  KernelVersion:	2.6.27
>  Contact:	Sarah Sharp <sarah.a.sharp@intel.com>

In addition, Sarah has not been the appropriate contact for ages.  Greg, 
would you like to remove that line?

Alan Stern
