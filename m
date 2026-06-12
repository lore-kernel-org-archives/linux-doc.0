Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F602264A7;
	Fri, 12 Jun 2026 16:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781280703; cv=none; b=dcEiBYg5q4Ms8gVNpmINGpvpGee2PV1+cSga5zxwJYAaacFHjhjb9erhjaI1tP4IeMQLUYM2SGnsat2wcyguvnRG2ULYaG/yLiIJLs+BhjdWvoFvaOMFC0zQKFiPEV+b0vpBGFSKirrBjxUJbun3eAVJaworPGGIAqoJDVgB/84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781280703; c=relaxed/simple;
	bh=4V0IOL7YlAQQ0EpOmlvSwODtyuV5WfMKOQz6whQk2GY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cg0COzFoAPXyVekj/PRiwfDO2r5i7rB42XttwtGmYQNKy5yj+x5bR20H/msYKxA5NmUiPVg4DDtMR2Q4KtgImSW+IlTpe+cZdf9pecQe8QpsrcIyms9kAUg/jVVLhdnW7q4/9aBRxoa0syWNS2DVrzDOM5Zb0eyZLzFzDH4QJhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=yLZdBF5h; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="yLZdBF5h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1781280696; bh=e2Flkizasq15JY9OfFzl9m1JufbWXvS/waAtDrX0mzo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=yLZdBF5hRt2OPv3xhRMH5v/4gcVFwnuf3uzBPUixqS9kFJGZDCC5HXLbPRxWA8voI
	 F3ywnC2tHzwAjcs871A9VEbmizliY9YKXhuo7j3HyOyExcI8cmzIg8ctMyzJrGNmea
	 JxIFBz5rJWSUQpbyciB0qJvz5mRWl3fhNC80c7Us=
Received: from [192.168.1.3] ([27.38.179.189])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 2E09B2A5; Sat, 13 Jun 2026 00:11:32 +0800
X-QQ-mid: xmsmtpt1781280692tp46q40e8
Message-ID: <tencent_94CB9DE57F16CF5DCED1C6983002CD3BB106@qq.com>
X-QQ-XMAILINFO: NmhoXJR/eu5x07qhCPSGAV8xT4ltbp9vVDXmE33u6+DF6JtDgyfhljErZOiQW6
	 RqJuKW82CB4sUTi/ZYTNHgG1+VroQWFTrkHCdlAWFDKb3hdohifcsCNqGINRWK53m5pLLIQmo/ca
	 iqBuW4YsuPPLv9s6CGTEC8a/lvd9qzXUQtONzveIEBIAzPNWVN69ArYCCYhmsGsAKqSbB+gEV60l
	 v6B7+N5S+1imeojQ8dn9E4wnv8uCL+EgdNbxXy03U3g4OpbocqxyiVa+EGutF0Vmfye4YyOm5iRw
	 vD3VvbMb/E383jpbnEPqKZh5gr/Q9nBrr1mpwG1mI+IqnJPcarlXj6NOBAAVfOMimV2Wq7PVdS29
	 ScU0vHDiDV1P/dufQhinM3fHS6+91f/5tbVq7TERh3R+st1kMR5OM+EE6z5C3kix0BqUi9FDORIR
	 dTwWZtIUIb0ngwnDtVhg7FjWBa4BhPpVZFcvcLt/OIYI60vIZThuV7CeVn6btFz2hjnxI9Q+MEbV
	 YMJ6ThZBi5FxqbKJIv+Bo6pEmkDAleGov+Zcq8rfrpyv9ucmVrMFvxrLFUcsO4bRUqnoLuRjZcLl
	 Xc8iecpA577I8XajwXrnY979fUB345PEo+tB/gfz8xiqnBGqeeEKX9/2AJvH02BSROBrNSwSsDYm
	 Ac8V8IaW6EHciI1yhrhX/YPm20yKyjh5Fh1032eTemScoVFXNQx7yyYI+ryKfoMFHZAVHglo1Gxi
	 cCpWweOl8dXcfvQpgYTxI0yMY3w4Ebc6l3xOzUMKA1TOTGkrIOx/lnjFEFlNzjHpgbgrmKNxp1tc
	 xFzry6S1GNSCR9m9J0PpJtTblQFPSQJH+mnBnivP3pN892+9kVuFpc14cjPdGphP1uScTuwHRSo0
	 lZLCdmvA8W0IuMI3lxvHA3V6NuSyw6N1f7PbSLfPsZTzThour0Dqx+ejMEC9moBoUeNfaLd6VHJH
	 4MxonhucSNWyx5AaoGRsc9vEsD18yZPCrmjEbr6iaJqTTHyH5lqdpR8Odb0ywbpPl3rKq6xK9wkY
	 8HDFyPHCYBuu+5n10n2wStCEB2A0jxXelTDuVaSMHFqNfvSHBwYJRWp100I9gnYh6fARU06X8gpP
	 tHu6qUaZWKbNIy0Ak=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-OQ-MSGID: <84ed0f45-130c-4428-8d9b-79fe383716e3@qq.com>
Date: Sat, 13 Jun 2026 00:11:36 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/zh_CN: update admin-guide/index.rst translation
To: Alex Shi <seakeel@gmail.com>
Cc: dzm91@hust.edu.cn, alexs@kernel.org, corbet@lwn.net, frederic@kernel.org,
 gpiccoli@igalia.com, jani.nikula@intel.com, kees@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, longman@redhat.com,
 mchehab+huawei@kernel.org, si.yanteng@linux.dev, skhan@linuxfoundation.org,
 tony.luck@intel.com
References: <4534170c-700d-43b5-ad32-6b91455b3f14@hust.edu.cn>
 <b7606f72-eb55-41a7-b685-00164050e159@gmail.com>
From: Yan Zhu <zhuyan2015@qq.com>
In-Reply-To: <b7606f72-eb55-41a7-b685-00164050e159@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Alex:

On 6/8/2026 9:40 AM, Alex Shi wrote:
> Applied, Thanks!

Can you confirm whether this patch has been merged? I couldn’t find it 
in the repo: 
https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git/?h=docs-next

-- 
Thanks
Yan Zhu

