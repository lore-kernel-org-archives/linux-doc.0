Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795122944;
	b=zJbgpHvN4fwgkKXghh7yLruCqmQmoOPQ4RNFHGGwBc9+GOgdVy/ykoedwtjplPcn5EOl
	 i0mgF2N1WfIOupwgIQyiuTlv/xUz3BmCyYSPj7aq5NlSHufPJ4R3RsCioVLkPNCgRQP+n
	 jEYfQY0Vx5JqMsqeNmOxxJogp/RqlGJH7UWNGW3v+1zALkVDHFvIjzJPx2QswCxvFSdYk
	 oiYI8/lLNkbj5HsJaVNyKUX31w1jDmWxcWzs8LcdmPPVi5VIbYLc0t5buMDR+3idL/2+Q
	 VaauaR60nvKEEKkZmAJ3cvJ8lWlawumeJQ5p9eIjPoNUTDePj9uB4sSOujnLTmmy7fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=x20yIuL8qjctClOTJkjN32yFm7DVIuZKrtelc9HlcHo=;
	b=Ebwv6iTyLl+TPC3QF8X76AKStSLrLmgtv36N7AkcAONk+5iFmityO/bsyfGbRBOPOPge
	 jBbT8+LycBAUdtz09rEOBFEwSkeAm7bl57ZwDnroSjaLivdGKfWvUYuADN+bxS5/pKGrQ
	 rlQT55g8fbnvKsHU8Au8aIOXBK/jXLgF/YAPdbNHTS0DdnVf2lZvjy/RytkmqaT8QB9/3
	 FfYunD86iEimcYX/a1v4ND+Pq9UE5LsbL/Jn2+fNF3pxEQwVlw5CnP6Ou1RkNRjYb6hP1
	 ml6a0UsxYqQiHXntB2UM6sE/j9EsCe1oDd7kFP/uocAKLZLzkyD6z/+51DNYCmKqcXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=O81sSxXD;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5F360A2611
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 21:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D5F360A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=O81sSxXD
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so288655366b.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 13:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795122943; x=1795727743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x20yIuL8qjctClOTJkjN32yFm7DVIuZKrtelc9HlcHo=;
        b=O81sSxXD9Hyp4+B1MUAl+1ndWb8mw2QCMbknLl8k5kwGnCWiCoke6iIYd9DQFz3/3l
         NfA6oJWn8yHuAMmKDz9S90CxVvUyCF5qk3mQyILtK1mjgMiaQunsfsveMIM+Vy4GrZdk
         zCxrvYTmaFer9gDPn9sAlceEl5NsELOHCC02U92i2uLdya5JNYiMWTaE18s9XxrcbCrA
         IytUCZt1zVQ/YyE7ycMHslHjJLRLwhgrPyDSP8sMDjB3amFPRTzpR1CjKY6qAhxM0C75
         2+4KqD5AD8t72UPHpWkZm6MXKsAbggCVCKLqKudPxYMNXKwy7DFxYYoyf0PaHAGA9+3U
         FuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795122943; x=1795727743;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x20yIuL8qjctClOTJkjN32yFm7DVIuZKrtelc9HlcHo=;
        b=JCHaxDhtVsFZzb4w8wfnv6ghV2CD6bY3oSW6Dumn0FZ9b8aUvnxo3LYRaDyAjwb16c
         fu+t6u95gihY96bM1XYKJtRFHv5i8ecaz+maKlrgPMeENur4LUEUcckHNe+4Q4fT8Vni
         xGlGcMUz/6B2oPTRdvbYnvxSNzzKmAzFrfQzkGj9cx/c8YEpXMVxo6s3Q607adOhnixX
         T5MMQ+zDETaThQuC5fXJxw1+yFlRMTFC0uC1o2+1mrY7TWIyH84fzfroqyHtfLpxnn2U
         ZsnsGA0sayGq/faUv4ERk6bzDa78ihEHok5ejy80+qErB7auiUXX67x7R48PhOtZKohF
         jUxQ==
X-Forwarded-Encrypted: i=1; AL+hErHQbi2ihjyZhfRn7Zhmqfr2f5k8looYCqhVVAbn0JGb/fek+ViQ1UQPPJi5LVyKf1gpNhYUXc/ge0Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Iz/uo6oALqgKqSWFmLElbHR2G5fFzO2zg03zhkD97MY2RFZHN
	cyj/b1Wumo9Ck0htjJ68BT9slpbIFVewHyrrHTT9LH+w63fHh47yV+7Y8kDXmj0YSIM=
X-Gm-Gg: AYBFou0qkTWzIaIfQcfub0Qb+Xgx1uhLw6wdlwJN2s5IaBRHKZta8U4+Pp9PneAq3mM
	vo4A9sZdvq+TrOfCe2E+8ekEHkwjr+GNDJPKsVWfA21bG6Msk/GSplp3RJqMciqWXb/RtGrnQ6q
	cGfgPiEh5qELe+eFzO+H6aAOJETEV7JM91nVAwwrS9rLi2Qxf7tLUwmcRackG3FrutqzgimeJ1+
	D1tB0rvkDDelSjdarJBvzcVPaOMv+QSg/mUFdXyZYljW9L75HHgfCPU6+jjcnuxDkm2n2XScVuY
	dfIzFSjvNWVdh7Noyl8MPI6kEtmtCG/HB+ui5Z7VLGDR2BL+ERTZObLmy+Xy4VucTLYGM1On/1g
	J+Nld4u8vLVYY+qZHQyLb2QQkM7ejcMUwvvT16iEU4HW04csbLf/A5ewwcA+WZQ4z8Ey74/OFvq
	BLeCnzb006C7cRjB7YqR3j6hSpSBudekScWK+Kyovq0m2dTpiLJJA4ybuUfbOPewxB2GtEtxt5K
	B8+c6sH28AsbX4dl7DXmo0qpn8KaEOc+YbUuo6BtusoQphDnIYlMobz+elmaEA7b/9xyxF/HRRs
	KDKUzqNzA6/4Ijr1QIW62g==
X-Received: by 2002:a17:907:7b94:b0:c51:cd1:565f with SMTP id a640c23a62f3a-c51317e3519mr262688566b.11.1795122942865;
        Thu, 19 Nov 2026 13:15:42 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm1027878a91.4.2026.11.19.13.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 13:15:41 -0800 (PST)
Message-ID: <eb62aa0a-b027-4fc7-8d84-05fc5329576c@suse.com>
Date: Fri, 20 Nov 2026 07:45:35 +1030
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
Subject: Re: [PATCH] btrfs: add a per-subsystem agent file
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-btrfs@vger.kernel.org,
 workflows@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <df1c1fa031ba7e66486348dc37d1a7be53c18e43.1794894953.git.wqu@suse.com>
 <63566373-86cc-4a55-8e09-741f283e6786@kernel.org>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ujyBQkUpLw5AAoJEMI9kfOh
 Jf6o8OIH/0mqW+TQM4m2x3hCsnK+oB4yJH1qnGvIhFF/Lhs48wI02sGh6/4aA0hkCDfd9LHQ
 +ci4FUepZ9y4VS01+oIExbg/8ytzGYTzLtb44jK2GBOBVSJkMiha6jp22XFt7WUkT/tvbreu
 WWdGsaJIRQaZChy7xsMI8lqQ2WdmluZJ4LT0wD3l/l6QU1ZseMGySebdY9sVOQEOJNV7Qj92
 /KOAFNmeZshV/qDI8Iw1RTs6TvLqCcqmlZLCmJkYSVhT1RonWRren8xIRcFEgMe004IDnt7V
 qdQhk/nhTS9x9MBAhMRl0TTE1VKDLvVALsud3iZLrmmtYvwPApzGJk052f0m28vOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ukKBQkUzDspAAoJEMI9kfOhJf6o
 SNsH/1ysUWOKmzY0rGS3ZdS61QgqMGhSWD/EJ4UiPw+xO4l4+GtX0fOAqxqsmBKqje3vyhBa
 Z5o/1Y+gNiN+E6RBcSz4b1TAd78sQ2bvT5DWOvBjeeVxHdiuQMIn4S8xk5ZpySBw5ifjoiuL
 0M33UVtJOzM8yfAeL+d/Rp4leJw72SutjkLyZTG/gJIp4pJGD/kFHn24OLL0IxEcO0gOekNZ
 os5e1R6jAJ2ILk7+MDnvU8wXHcCiVzuDhJLI1tih1uUIE50muHQJWbYuVBbdJeu8WlIDDssx
 UOCxLylNG3gDXV5MhLubPTOpp9OiFc/XC37nvkgEcrlmlOFBv4/NJCbECpo=
In-Reply-To: <63566373-86cc-4a55-8e09-741f283e6786@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/19 20:44, Krzysztof Kozlowski 写道:
> On 17/11/2026 06:58, Qu Wenruo wrote:
>> I believe btrfs is not the most affected sub-system, but a lot of
>> newbies without common senses are doing more harm than help.
>> E.g. wasting a lot of human review time on very low value fixes, filled
>> with long paragraphs and useless test steps/results.
>>
>> So it would be better to let those agents to stop being stupid and
>> follow the more common practices here, and hopefully those newbies can
>> build some common sense.
>>
>> I hope the agent file is clear and short enough, that is not only
>> readable for LLMs, but also for humans who want to be long term
>> contributers.
> 
> Then it should be a maintainer profile. We should write docs for humans,
> which can be used by agents. Not the other way around.

In that case, what's the proper file that can also be applied to LLM?

Thanks,
Qu

> 
> Best regards,
> Krzysztof

