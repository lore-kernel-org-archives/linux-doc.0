Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310576;
	b=FWlspSqBqFUB2irSidA2o5GTHowUBetE+v7MaYjxrr5DkcLH+6xi3DJ0GNJ5NonIybMI
	 qBXS1ePXCpqIGUjCOUcnehLaspKyc7v0e8Pmx24Vxfs9PV7Dea9YXtXwwOCbvd3iUGlul
	 +fuwfEIa6pPlsXVycUO7eedKloy9cPthmbc5/PiShSXBXXRjtuE26NL6XCV07NwVlB7fy
	 I8g9NHG5B85x/PD7WOdbp4I5UoxOLmE98l37XycgO0c8rUhOiXAhU9lT4rIb5i0WhixSy
	 GWqp9GHOuP/s/eiD4uPsqN3Nna2J1xbQOo8d4K1MsNDywU6LyDIZ1LZ0mNfmElWwV/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=KARVFzaA2emNcbaNE7Zlfo9u+xQFHA5uL67hKotT2QY=;
	b=2/N3+qpF8ZlVPlAsAhEQ2J4y2OnS5lXNfJQaDHwhOW0yXnbzX9sRvMykzCoNwPe3r1p1
	 4qkovVVBPovkPDsN/vL3816amcInnEzqeJOwA0g6Mdb125zTOxo8Qdai7uwemHa01iz0r
	 IZfp+OOzegBF3nhd4CHYPXA85YF3M0b71Xq6eXJJ/GqYP+xEPmEtV2K86tjjJifTqQSYO
	 W0LKrDSbaiv58LA7cWRqlC8f+6mrnD/t2RWXhZQ0HVJdl4epsYoKXwzA/TywzWwwdOcWP
	 eAJEvvxn22bfkJdAURrlyCkwtQEYUiw33g87oWP70/PzISA97SM1eJ9YbMVT4wQnPbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rw5ebseg;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94E5606A330
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 11:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D94E5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rw5ebseg
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so15516245e9.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 03:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794310574; x=1794915374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KARVFzaA2emNcbaNE7Zlfo9u+xQFHA5uL67hKotT2QY=;
        b=rw5ebsegRN1Bjft/2/4FWIrxGMhY08bhzAOpYaPg5CXXWQYAoujXytRwfsQgivSZFa
         LBv4hprncfZ8YS61fd0bNtRQNE5xOMEqkeN3rm4NaT0sGl300b5/WnB/xrIDvEqy3/ee
         zpOyMM7rUSXHTaJC0QMa3DdxfAT031eWhpVdBU1w2NB2kmqe44IPIjDsxlHFws6FXG5D
         rwoG5+o0rhLEQmMevMoCUNjQpMuJHswFJ4AGVpZ7owRWHdpTNFJdn/5tQsiHIDetPgnX
         4ZjLG5Wnx0VS72E8PX1au1kM2YZkzm7n/Au+dTEGRH1LNbcwuIt6x+5ikP1vzRUuJWyn
         V4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794310574; x=1794915374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KARVFzaA2emNcbaNE7Zlfo9u+xQFHA5uL67hKotT2QY=;
        b=MM3TFDW4hWlaBW102Z9/ok7KbxP64UR4M60scRTP+CQicMujqI2T3HT51tCFPfwb06
         XvSYcw6cM8oEvhUPn4Zritj/FzZeakoduOD7k6KGs4aoBmkbcI02Sl8XNUbpI5Nso634
         D5rr01wRbvrODlLbM9H8QwvGraoQIh2rOfkAgLUfiowGxWVTzATn4oQU2DhAwzJmu4as
         OUPn4xcTgh7i81dUeSpAMcg+0TYIAUg17aFa3I5AuLooiQu9vnxgz9zd6V/+Twxl9hCh
         30QG4OLec5yCkse4GP09YVOvi4zcddwBuPWYjTI/7DXsds/6aopWQX5qEJ867BZsGVr1
         8/3w==
X-Forwarded-Encrypted: i=1; AL+hErHpIwfXdFyNlRliSQW4hqTVaqEXapU+heetkF5RjZYHlgvBvBufM/I5FGeFMZtiCeDePh63QQlVAtA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IFMa1PADCQ9lg50J49Y9qmYUU7TXHW9y+LecfToYwn1wIyI//
	ZZhC+ax7wRtB+NaMO+axDSo5gqZwt7P/M9FFizz/uSKpa9NmEejAqjug6PK6IVitKBQ=
X-Gm-Gg: AYBFou0nxrBG8sj/sKyZymRCKZwZHUVqg4w9OsRPxKA+yjsHd3iRwujse0vyUBVqHNk
	ERV4Dww2XKrlqI7Rzog5DWc6R5z8JkZ75H9NTc2sXcPgqoo7PtsKw7tAPyFbXG1FgyFOIHBhejG
	NEeBaqzfGyVhRu9PQik6bHG621Mg6JsIOaQlZuJBIc7u3CRIphpDfNbHFU4gu4NyfBwC/fq5evt
	IP3GY/4flKjdR1XsffsdOTCRtmqds9TYn+JwQTdE4MmtYxUDt8GSYQ0wsy6e9ZVqGBTVqGeW+ou
	qR26cJLg3f+0R54M6ueuFUGzefp1iXuO87Cmd5myyqDyao+XtL/k+A6Tv8wW65xZi8DRauM1ygw
	NCIw2mMdjya97cdP74LsJxwfh7XeKXq1eVRCjXF7FPQynmMzr9/RE+wEns2uOZlC19T34cVLK6y
	WTZxlMpn6qE9HRaV4noBZXQy+Y3y0PC9SWZw8xVwKKYVtapw+tZdhbHSflnHX72GAbcyd21Xnu8
	Ljw/5CDFA9Ut9DWr3f0//jastA5nxVT7MPByLYYo5C+Lb9Z+Ab06o5ZiJ4P3MHBjrydTDkgmi5T
	QZz82R6AiUKW0onqnh76XHUSh/1GlSXA1Q==
X-Received: by 2002:a05:600c:34c7:b0:4a2:150f:1609 with SMTP id 5b1f17b1804b1-4ba0233bd68mr41274365e9.8.1794310574048;
        Tue, 10 Nov 2026 03:36:14 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba020485bcsm54874055e9.11.2026.11.10.03.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:36:13 -0800 (PST)
Message-ID: <6d0fabcb-79eb-4a17-af3e-b58a1d1c93fa@linaro.org>
Date: Tue, 10 Nov 2026 11:36:12 +0000
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6.y] perf cs-etm: fix a compilation issue in
 cs_etm_decoder__set_tid()
To: Valentin Caron <valentin.caron@foss.st.com>, gregkh@linuxfoundation.org,
 stable@vger.kernel.org, Leo Yan <leo.yan@arm.com>
Cc: Paschalis.Mpeis@arm.com, aaupov@meta.com, acme@redhat.com,
 corbet@lwn.net, irogers@google.com, jolsa@kernel.org, leo.yan@arm.com,
 linux-doc@vger.kernel.org, mike.leach@arm.com, namhyung@kernel.org,
 patches@lists.linux.dev, robert.walker@arm.com, sashal@kernel.org,
 skhan@linuxfoundation.org, suzuki.poulose@arm.com,
 amelie.delaunay@foss.st.com
References: <20260912065621.463708027@linuxfoundation.org>
 <20261109171457.1233670-1-valentin.caron@foss.st.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261109171457.1233670-1-valentin.caron@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/11/2026 17:14, Valentin Caron wrote:
> When compiling coresight tool with the command:
> make -C tools/perf CORESIGHT=1 all
> 
> The following build issue occurs:
> util/cs-etm-decoder/cs-etm-decoder.c:551:15: error: too many arguments to
> function 'cs_etm_decoder__buffer_packet'
>    551 |         ret = cs_etm_decoder__buffer_packet(etmq, packet_queue,
>        |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fix this by removing the parameter "etmq" from function call to match its
> declaration:
> cs_etm_decoder__buffer_packet(struct cs_etm_packet_queue *packet_queue,
> 			      const u8 trace_chan_id,
> 			      enum cs_etm_sample_type sample_type)
> 
> Fixes: 99d324594165 ("perf cs-etm: Queue context packets for frontend")
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
> ---
>   tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> index 277da9f767b9d..caacab8c92e26 100644
> --- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> +++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> @@ -548,7 +548,7 @@ cs_etm_decoder__set_tid(struct cs_etm_queue *etmq,
>   				elem->context.exception_level, tid))
>   		return OCSD_RESP_FATAL_SYS_ERR;
>   
> -	ret = cs_etm_decoder__buffer_packet(etmq, packet_queue, trace_chan_id,
> +	ret = cs_etm_decoder__buffer_packet(packet_queue, trace_chan_id,
>   					    CS_ETM_CONTEXT);
>   	if (ret != OCSD_RESP_CONT && ret != OCSD_RESP_WAIT)
>   		return ret;

Reviewed-by: James Clark <james.clark@linaro.org>

I tested Coresight decoding on the 6.6.y branch in case there was some 
other non-obvious dependency missing, but this is the only fix that's 
required. Thanks!


