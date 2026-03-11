Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735583009D4
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 05:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773205892; cv=none; b=E9RuVVdz1joV2x/0mKYTb52UNqcfU0ShN5WiY0qFlpwRfoAhqJynA9BQs8ZoSklejYKf1sJ1IL+6s2b3NseqvAIXs3r+dVZpkXVlTlGBPjsPPWt/Vezcir7wVPYQrnDEtjIU8Ast+MGRbbtUAwXEuBWvLf8p3sOJbYa0kvsi5go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773205892; c=relaxed/simple;
	bh=SKQebgFHBXfmM2lGdrhEr42Q1f+W474nmfBE0BMUDwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNNMOllOyaXnqwj54vlBAKhwu0ldYmq/1ge6VKPOfX696BEIMG8EAjEpmuoCAOtfSpAJk5Ifgn5JTObUqWAoFMFtAfsNHcoYs4OoEmDcVJkhqfFazK9USVkWfRIgaSCAwCPHyg+1OOc9QKytdVniBLtVD7Q9gveASzq7fF2ND4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkXx7CNI; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkXx7CNI"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-128b9b7e3edso574019c88.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 22:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773205891; x=1773810691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8PBbyOmDB5lQs1yLkLN/9EtPkXrISR2EjJXxH+dMHsM=;
        b=nkXx7CNIsPBIINWlffccvLIOHCQEPfVZJTDBY3QYThNs0vdPcWKFl13Id5VYcuF9lX
         ZSLZNDLJk9x0tvTx6+G4UXPlZsziM1cx86AvYgB7Asr4FuMT7cYst/ZQX9GLAxJgXucG
         5Y3R5gyDxl1cblWgwGWf7/VHGNtDq5hBiU0UWQG2JgG5wviCVxA3+DA6yAHSjNgJ8ewI
         rUED84wid8lBKNXpNlmvu5SNBi6IudF/CNvvwEYVwhURSyzyn97zBwZKXe4DTubxrJ/7
         EWHIcH7ISyf5BR0+IjqzpE/jH1bTEKo1hdBRaq7Gt3waGOwapkn4afTETFJkxCpIxyjJ
         XLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773205891; x=1773810691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8PBbyOmDB5lQs1yLkLN/9EtPkXrISR2EjJXxH+dMHsM=;
        b=PKOoNM80+aJBbsWtSC677sKLVFpNWcsc3AQckhh9oUoxzfoONVGFSIzMJKIPQvgxwl
         UuxqskEyNC67QvqbX/Zi1rBzNqQTHeT8sP+4TDQHaFh512Oal1cgy5XmwPxNbG0r28oQ
         zX/DhIBggKfNw+a0hGY/oGC3RjuE55w8c3Frp0YVFPcYPy+egDvy8gBPW62jVK4M6l4c
         9w6Z/PZ9TpI5unCY2OH9sJ0AFb1jhvbKKqQoK/uZQ0vRZfASHXzeTNOWZJu5YaYmk6vk
         KDRWHMBM/8qnbZA6fGc0qVyyWzGqpWV/taKLT4aE6Ub5rHzc3HIzNZXy1KhDuZU8bjaU
         qFVA==
X-Forwarded-Encrypted: i=1; AJvYcCUmYCNq4/fO8WQISJ6a9N9WsyeEwvpmtaBEasd+F7PBVec5OutyxODakPDo9flf//htIZq+TQQkhI4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXEQmjNgLv3WMjXt4a94JA9NOQnPm9BZvaMUTuH0VXpjHUhMlY
	vFMSjMEp73MdyL6ZoC9s0sFUU5wNZeAut/48hgx1sKUPk7/6P3BtVOW4
X-Gm-Gg: ATEYQzzZZsqTxSovdCWb+XlpaxQkr/ffucuDbjxnw4ljBibjBTkrfVylE0tHBzub8ur
	wmyGPB/rEDTm9z31m/yFixV56WuzOXr0c7YgdeFhybhxmeG9B88H8WtjaRX9bkDdC9CitpPNsPK
	/x9q6HegvXElXSrCJ1BTNaeoKyGKkjaaj2kcY2hOyOb7HDEB/Wdet/lAKYgof+OheC/iDpuAV/P
	yvXLZ5zQC9PovFmoQhjNzMb5iXNE1xFxqFG6Et2nk206Dc+CUCYLeWtIKnBEtQDUqSTpTtfNxNu
	Agp2A8hYGihzWjQAnGkNljhEh2Haq8cQMmKcOmq/M7ILnlhKetY2p9DQCBfDmFSCrTJtz4dw0fy
	/UeiKTepeJR/LGBf1xhcgLM8Hlr0K4EDRoBp3VH1GNDtdqJsHz3l2P/ACRY8DKa6a9AK6RSG626
	1ZKNC8ObUj6pCqOjVE8CR1TpZlvAHFWge+KeAPPIt2QI/bsM3UcGO5Fse5lA8Sf7iw
X-Received: by 2002:a05:7022:501:b0:123:331d:bdbb with SMTP id a92af1059eb24-128e781fe8amr639411c88.22.1773205890451;
        Tue, 10 Mar 2026 22:11:30 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:6e17:9d84:ffa0:986b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128e7c1ff96sm1369730c88.8.2026.03.10.22.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 22:11:30 -0700 (PDT)
Date: Tue, 10 Mar 2026 22:11:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jingyuan Liang <jingyliang@chromium.org>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Mark Brown <broonie@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, hbarnor@chromium.org, Jarrett Schultz <jaschultz@microsoft.com>, 
	Dmitry Antipov <dmanti@microsoft.com>
Subject: Re: [PATCH 02/12] HID: Add BUS_SPI support and define HID_SPI_DEVICE
 macro
Message-ID: <abD5ZAsNOQ-wOkQ9@google.com>
References: <20260303-send-upstream-v1-0-1515ba218f3d@chromium.org>
 <20260303-send-upstream-v1-2-1515ba218f3d@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-send-upstream-v1-2-1515ba218f3d@chromium.org>

On Tue, Mar 03, 2026 at 06:12:54AM +0000, Jingyuan Liang wrote:
> From: Jarrett Schultz <jaschultz@microsoft.com>
> 
> If connecting a hid_device with bus field indicating BUS_SPI print out
> "SPI" in the debug print.
> 
> Macro sets the bus field to BUS_SPI and uses arguments to set vendor
> product fields.
> 
> Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
> Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
> ---
>  drivers/hid/hid-core.c | 3 +++
>  include/linux/hid.h    | 2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index a5b3a8ca2fcb..813c9c743ccd 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -2316,6 +2316,9 @@ int hid_connect(struct hid_device *hdev, unsigned int connect_mask)
>  	case BUS_I2C:
>  		bus = "I2C";
>  		break;
> +	case BUS_SPI:
> +		bus = "SPI";
> +		break;
>  	case BUS_SDW:
>  		bus = "SOUNDWIRE";
>  		break;
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index dce862cafbbd..957f322a0ebd 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -786,6 +786,8 @@ struct hid_descriptor {
>  	.bus = BUS_BLUETOOTH, .vendor = (ven), .product = (prod)
>  #define HID_I2C_DEVICE(ven, prod)				\
>  	.bus = BUS_I2C, .vendor = (ven), .product = (prod)
> +#define HID_SPI_DEVICE(ven, prod)				\
> +	.bus = BUS_SPI, .vendor = (ven), .product = (prod)
>  
>  #define HID_REPORT_ID(rep) \
>  	.report_type = (rep)

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
