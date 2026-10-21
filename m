Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792587741;
	b=Sai1mfO8J/f0jFeEWo6eo3l8MzK/7m81UTE+OuTkWT2HfibhYBJ7jsZvCSoHcAJs5Mix
	 J4ms/72sfRPDbsbsFyrGmH5vRq8VVKufjY3jWtK2EawADM9+Lv1yLBCk5AGlyLHKsR4yk
	 DdF6htrJJVb7TVmaajqC8JSUfc/R1rN0e6khyRZNdVnTX6AHz3dXQfnz2NVPvdOCyjsSO
	 3ROypfE3MeCKbsi9DxSWtjJP4tTBjk5n79FMErYKBTbsJKcae4+ADXdZ1QLony90KnQjB
	 KWsdJp5rcpo9LJNYm9bmYi2HRORu1VoEhunYs6aImdcxJMWH6CN/FcwrJXXQIVIY+tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2rRV2H4h03gZ3b1/SovjGOKPTwZ60MnMe7g0akSG3kg=;
	b=3RP4fVgUfMPgZvIpD2+zFi0DBUVUt5RHXZNF+kebmNILrs46+F7SB40v7qNwXNRahken
	 0r4QheQoRJYQeyba0x4Cpw1CNJvN7/rClsjjMztGdqv0CfoW7hxgjjx9OtjRWVNhUr2Gq
	 q4ZwJsaYSB7IdKBWQ1VSOl9vj19VIBQOBUgpsRGHnavg8uCa5L/icAewpnLnuFJeWlyZP
	 Xh7tk6YHBPQpOcNwIMOogkriO9kin6lmxO1psUxzD+0BppRFgIERMTk/mLIj7UQRxbJ/T
	 dPi1pGDCWXTdTsXiKtnigfPId7kV9lM0dctWlsYqB2kqkzvmOE8Fgk3/EHQBWydNPvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=euopJz+p;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDA7606A31A
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 13:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BDA7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=euopJz+p
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dee593f18so567213f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 06:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792587739; x=1793192539; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2rRV2H4h03gZ3b1/SovjGOKPTwZ60MnMe7g0akSG3kg=;
        b=euopJz+pjeds0kTVS6Ht4xG8c+AXrBQd/H5yDC6EkJnecY6KtvzTDWjEsS9ah+6rw+
         NPCORtcpylG5gH836a1tP1Az8V0L/m0C2FdgUlj+xKAYCUvKxpS5Vi8FfoqvDGbaydrO
         l2Q4+hgat7vk1g+oPoXZDEHnZboQAgIlf6hBazhvvcHd+vyrzEh8XevdJ1zG6jvlS8QJ
         SYn10PHi86DHfweJuq8xngUWKxjWVMMSNuLbbiTk3H2qBTqEWo3UPA9EWqR3lM2Rx/tC
         TrqkWhN3xZpndODNYWQ+aCDpa7E7ysojb0BVKWbPhXrXJRp41yjpPCy+2ID/71cy0Klf
         nHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587739; x=1793192539;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2rRV2H4h03gZ3b1/SovjGOKPTwZ60MnMe7g0akSG3kg=;
        b=TmhsWDNl51utH7oX81vHe7a73ms8lsWkCJq0sSMVpGE6PWImAhnkeiGFZTajHPL1rQ
         iClrY1FZ205oaicz2DLcRrbqVBfj66zcpZ5QiIy2wk+BUQjrNSjf4sFaB2GNSYq/i0sX
         G1phwYMxYSLrHXJ3DJyT6VvbBHjrlwz9BkM2CHmzDQ4CgiALGg73X9HYoFYAip5eGSnk
         qBIzfn+FPtAlDQqv+G/UutLkaun9ktwNRKEz7dNSyBeaRHhFg9L+1/texAY0VUq1aIut
         5qnWXIWhTS2DBXFMu26ehZ/9kGSMK+0rJUvYUWHvhFUZWUYGg0/+LpDINJ6Smkwu0lVl
         i+Ew==
X-Gm-Message-State: AFq9FYJJ2Oa6xRTRBDL3Ev/Bxn/G/vWpNDJLju3jSqDs7XBAtdTMwsHC
	4SHKMLjIw6TNPDri8TfqooBhdgyzgnpLMasC/N6qDKDXviZzdB++Odvfal3FJnNw+cc2T0k7ghr
	8BPlSv8o=
X-Gm-Gg: AYBFou3M+VRtNP01fxh2TBXFtgZRBLHx7Xmtuq1bbrtRTLsV2ztJLgpxRngm+y7B5K6
	nmOX4Uy+zkLqIokqqbrRuE5GRcQ9+hbvLUxZXwbZ7wwdhPRPK6I6+uTOxLuHw9qd8jXM1TT7rfv
	tyotbWvan3G2yam0KQqaCst0JbrjXuW07R5VXHKusK+NjG8ipwLDh6NLCciCq0ijceLrNWAc5gY
	UwzbK/O4GuLQBp+rk0esmEFhq+5OX6M/pVZ0k54VygYjylS5ze5R4WBVhlaJGkTjMPIuyife7R5
	uQfqz6jjmuOvzfbGeITiUSiAJl6LJl2PR6ZkooS/SD+7Ky9YckUGnjWMjnJhs6kExG1MFReJxwQ
	nhNnAPKPwABOqb66rWnszf5Fmw2VrxUoGrnmma51qxqcFN7Zwz4Fktpksaggx8HwNbrwYKOryZn
	W6mDKnok/z8thY9UrzBzneDCxfLxTTdfHHJnFot01GOA4fftJjWHCCyf9zozy8mIOrxPU2lKd2I
	yiYmSrfe2mPGrDUixVjmgZiRQu6/d3e1zq6vgKA540ZByNsL+qP2sjYYSbepn1AAB3z/UNx
X-Received: by 2002:a05:6000:1861:b0:48e:cd3:b3ec with SMTP id ffacd0b85a97d-48e264bc4a3mr3963209f8f.28.1792587737323;
        Wed, 21 Oct 2026 06:02:17 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581f412sm5616643f8f.16.2026.10.21.06.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:02:15 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:02:11 +0200
From: Petr Mladek <pmladek@suse.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-doc@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>
Subject: Re: [PATCH v2] Documentation/printk-formats: Remove notes about %pK
Message-ID: <ati309dvpw70TkzS@pathway.suse.cz>
References: <20261019083040.Fgpb8Jz8@linutronix.de>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019083040.Fgpb8Jz8@linutronix.de>

On Mon 2026-10-19 10:30:40, Sebastian Andrzej Siewior wrote:
> The %pK is slowly vanishing from drivers. The %p already prints hashed
> output unless overridden at bootime. It is not obvious for the user which
> output is using %pK and which does not.
> 
> Some people pointed out that this documentation encourages people to use
> it so here is the removal. I also update the translation since the block
> looks the same.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

> ---
> 
> I intend to send the admin-guide/sysctl/kernel.rst bits with the removal
> from vsnprintf itself. I am down to 5 drivers (as of next-20261014).
> If you think that this documentation should remain as long as the
> interface is available then I can postpone this.

Good question. IMHO, it would be better to wait until all users are
gone. The people reviwing the removal patches might want to see what
the modifier does. I think that the documentation does not increase
much the risk of adding new users.

Best Regards,
Petr
