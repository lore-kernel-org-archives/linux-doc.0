Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EEB3845A7
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 20:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433225; cv=none; b=qOXRt6KpAu8BkSbWENhtVkEu5rViTAk9B3qZIclXRUwjizDrpabN59ZrS2dd5o2CmGu5bNOy/gUJwRG75dfpiV/UJj4OnQjFcje4l6rsviKvF8T7tGVPzg9z4LLLkAfwfTFx167uNS4Aw5oyVDQLlg8487Pnc/SR/Jt/njToYbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433225; c=relaxed/simple;
	bh=kQ8cgB3chOAN17hEm/eeLSHJ5xg3tiadPzBdxt9aOWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ogg3mCtScaBzclFl0ZzYT7Dx2/a45qoTInNNCoYtMYHJg5dS2DeOFuWXQlnzMMoLB8Lf7HY3g4VhaCYAkv257NDs5ZXz7U/1PUBFU0wT7O6RCHlTD8LlRfVfopeeOJPY/yrmvyuwYEy+VWAZLydEDd9dqQtmpqSCuFA10Dd9I1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjQGWDDA; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjQGWDDA"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49041e84237so97133475e9.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 13:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780433223; x=1781038023; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E/F9SBkHIYEzDXTuA4BV3hptq8kg192HlVg4BWvVGGE=;
        b=LjQGWDDA9Sy9tOZbDBiE5u9g4+2nVK5G6R7zW3H1jwqDbvVCeqVPeCJ/QhDoKOKidJ
         lyDZ613diL+iE8dfwRlU0nAZGAZ5IB1G0tEON/WQMWHOIirlIWe25gvFHKshlhPB8nCO
         OsjycmkyzJNcYNMaKxua/PYMejOv/MEahjBV5+m4hZhM+lJAM8ZpkVKnqimswxuByT9Z
         DpVVGY1sQYHZ6QBQfs8UivESfasd/qFVxJUpRy8W7C4KhCrh2Pua1PP5XHnXcp97j18e
         ec//MC8XgmkN48EMwIvAkYOFSEnhEZQ9MIYGSGFm4FoAhOeE/WePnA8HQ1BPPYwzT4Re
         AZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780433223; x=1781038023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/F9SBkHIYEzDXTuA4BV3hptq8kg192HlVg4BWvVGGE=;
        b=kha3NSj+g63sG2gGtoduyqaBthRd2taobpbPgkHOGU0Lr4C0UdCtshKJpNQgVCEFZL
         p92sC1NaP92+FV8cfdz6lizAJNOCeq542jCR5h3v29a7hjyaETHXlB4nKhu6/CYxt29N
         HC3V1oQQFfpVd2uBL69dc/7Aq6CYXz8P1OY6o6POLT+fDV67EDEQS7EhAiAGncdy/eEw
         JN4WNUdx0a6bQodY18gFFn4RN96TygqcoFO8I6bsR7hbW+d88uCkQvuuwkhg3AG1rxAs
         TYrToFSPGmPJofZGQvQv7x7jfnibUM9AwyaW37bdyyhhmSacmhsVOjQciC5nGhfgk5DU
         BjkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9QofP8CCK6IqpKbA+Ldb5J8p4F33DbFi3Dx2WkCRRIKrx6xXosZSLrikgqze1Cz8JdHOhaJ9PJsdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwumRzOMFEZKYHe9WzAu2vo5LH/IGkVQPdnajlAymYi3yyiIByX
	gPPytk4l7wyg2u+cVCxKFI8Fs94TMOJ8Rh5miJV2Zzr9OiPyXp4h3530
X-Gm-Gg: Acq92OEDhoQg/zL7vkyA3CViogbAA4mFL8X8+r+f56gq2XSZGVBkYHWeYOn0gydECux
	+CJscihZCTiGHYhqjExO9l+WodYNlvKy46psQKTruuA6K749WBZyguiIf2WAM1yBDGaz27Dqqpz
	IyJtaqI+nFPV32JkTxBVAaW3Ut5hMlIpUJSxxy2qzIi8rb8Jki8Jmm+yduvex8iEg6ECjiE1N9q
	jxMrliq7rTJ8yKXMIVsIDr6DcW+rsU9CmFTk8x6RqcWjS+4vQvsyxhnqQauWM1EhXW1E4AE3QqM
	9hfPZg8/ee1ejtdoQCnZg8j0YtGWfwiSts0CFkgKoZmVq7gmyinq8BwiOY79je63lJMyp7jB5K3
	O4PlFm6LE5fvF9NK3gxgUahtfAl2EaX9R7DY9agsfpyoNLvLisJoTGEcMa6VG9U4UDRO3ZMGFz2
	AmWtmP3ii6rICLBkfEGOTyPgFLtSEaRcwcY18HEw==
X-Received: by 2002:a05:600c:458b:b0:490:af63:2cb1 with SMTP id 5b1f17b1804b1-490b6128dc3mr5058205e9.7.1780433222731;
        Tue, 02 Jun 2026 13:47:02 -0700 (PDT)
Received: from [192.168.0.2] ([212.50.121.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b60f6d5asm5811745e9.0.2026.06.02.13.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 13:47:02 -0700 (PDT)
Message-ID: <e7df5082-ef48-43d0-ad07-10e1e64e1d26@gmail.com>
Date: Tue, 2 Jun 2026 23:46:59 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] net: wwan: t9xx: Add MediaTek T9XX WWAN driver
To: "Wu. JackBB (GSM)" <JackBB_Wu@compal.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Jack Wu via B4 Relay <devnull+jackbb_wu.compal.com@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Wen-Zhi Huang <wen-zhi.huang@mediatek.com>,
 Shi-Wei Yeh <shi-wei.yeh@mediatek.com>,
 Minano Tseng <Minano.tseng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20260529-t9xx_driver_v1-v1-0-bdbfe2c01e57@compal.com>
 <20260601173401.2c892526@kernel.org>
 <c279aea41ecf41c6aca4314a2f4e306b@compal.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <c279aea41ecf41c6aca4314a2f4e306b@compal.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

let me join the discussion and put my 2c.

On 6/2/26 13:58, Wu. JackBB (GSM) wrote:
> Hi Jakub,
> 
>> On Fri, 29 May 2026 18:31:39 +0800 Jack Wu via B4 Relay wrote:
>>> 43 files changed, 14761 insertions(+)
>>
>> Please try to cut this down to ~5kLoC for the initial submission.
>> Whatever the absolute minimum sensible chunk of code is.
>>
>> Each patch must build cleanly with W=1
> 
> We've already reduced this significantly from the original 41k LoC
> down to ~14.7k by stripping out non-essential features such as
> exception handling, memory logging, devlink, statistics, debug
> tracing, and others.
> 
> We even removed some arguably necessary features (PM, mdlog,
> throughput optimizations) that we plan to submit as follow-up
> series.

Great work. Highly appreciate!

> Note that the line count may slightly increase in v2, as we plan
> to add missing kdoc comments based on review feedback.
> 
> For reference, the t7xx driver (two generations older, simpler HW)
> had an initial submission of ~11.3k LoC [1]. The t9xx hardware is
> more complex, so we believe being in a similar range is reasonable.

Let me elaborate a bit here. The size problem is not due to a git or a 
mailbox limitation. It arise due to the human limitation. The T7xx 
submission review took something about 4 months and 8 iterations. And it 
was 'only' 11.3k lines. Let's do some extrapolation assuming that 
function is linear. 14.7k is 30% bigger, thus, estimated reviewing time 
should be 5 months and 2 weeks. And this looks optimistic.

Recommendation, shared by Jakub, is practical. 5k lines might be 
reviewed in a reasonable time and merged with the full confidence of the 
quality.

> We'd like to keep the driver functional and reviewable in its
> current scope. Do you have any suggestions on how we could further
> reduce the size while maintaining a working initial submission?

Off the top of my head, I would suggest joining T7xx and T9xx code 
bases. It could be done through factoring out a core functionality of 
T7xx into a library, or through making the driver layered.

I am not pretending being an expert in any of these drivers, but 
generally divide-n-conqueror together with code reuse work reliable. As 
an alternative, I could spend a couple of weeks reviewing the new 
submission and will come with more specific ideas on what can be thrown 
away or reused.

> [1] https://patchwork.kernel.org/project/netdevbpf/cover/20220506181310.2183829-1-ricardo.martinez@linux.intel.com/
> 
> Thanks.
> 
> 
> ================================================================================================================================================================
> This message may contain information which is private, privileged or confidential of Compal Electronics, Inc. If you are not the intended recipient of this message, please notify the sender and destroy/delete the message. Any review, retransmission, dissemination or other use of, or taking of any action in reliance upon this information, by persons or entities other than the intended recipient is prohibited.
> ================================================================================================================================================================

And this disclaimer does not facilitate the review. Am I 'intended' 
recipient or should I destroy the message ASAP?

--
Sergey
