Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6045628F1
	for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 03:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751252637; cv=none; b=crZJ+o2FKy9fRAi3nwEB8PzEyr8eU72u92HUUEpnYGLyTiZNP0/6v2lsQUkDT8VohBGJUYPBRq+m6rSg/8BrXRob2C4YLjkzW7ZC6IZVAq6drZrj9NGn1kboK7aQSjgK1pTCn5pgUqg1sXEykKJU8LtskWJlK++QyUd0T4HHrS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751252637; c=relaxed/simple;
	bh=92eyEauosHF48/mdAgtPhp85OqJIiOWS5c9Fl0bcMSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CuRxcC7D8sv8EZ6njkMpnC1FAuElpKEcukvnILrGQgw5kD3BPMI+7o3DRZtwxLATFI5JDPSUDUnU+zxY9Jvaee5J8NCSSLsPmAEkYbHyIOtE5u5gaSAK30iNyVi0m1fsQWb9/oYsl6082Eh2x9nGae3pFpMW8bHOzqCUzv9JlcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nuc5fIA8; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nuc5fIA8"
Message-ID: <70da9d7d-9040-41fb-8af3-33723b650d83@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751252632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GqdAZR4/Js5i8ZOfp7OAisd7LUV/XHQX+Up5IMGtagM=;
	b=nuc5fIA8yKaCJbMk++hffHqCim+o3YBv9hONyP3QF/tYOZdqEyVbEXM84xQ1+P2MwfNURa
	NOSY1ZpZUYgE+5KUuuLrjpJ8R26pLJ4dzFDn8FKMX8IvYAl8ERCxrg2Puc3OOTctWrsqKo
	RtKn7Oz9u5Ef+xySN3ww2RuQgGcvrzY=
Date: Mon, 30 Jun 2025 11:03:48 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] docs/zh_CN: add translation of scsi subsystem
To: haodongdong <doubled@leap-io.com>, alexs@kernel.org
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org
References: <20250630022934.1600937-1-doubled@leap-io.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250630022934.1600937-1-doubled@leap-io.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 6/30/25 10:29 AM, haodongdong 写道:
> This patch introduces the Chinese translation
> of the following SCSI subsystem documentation
> files:
>      ../scsi/index.rst
>      ../scsi/link_power_management_policy.rst
>      ../scsi/scsi_eh.rst
>      ../scsi/scsi_mid_low_api.rst
>      ../scsi/scsi-parameters.rst
>      ../scsi/scsi.rst
>      ../scsi/sd-parameters.rst
>
> Signed-off-by: haodongdong <doubled@leap-io.com>
> ---
>   .../translations/zh_CN/scsi/index.rst         |   92 ++
>   .../scsi/link_power_management_policy.rst     |   32 +
>   .../zh_CN/scsi/scsi-parameters.rst            |  118 ++
>   .../translations/zh_CN/scsi/scsi.rst          |   48 +
>   .../translations/zh_CN/scsi/scsi_eh.rst       |  482 +++++++
>   .../zh_CN/scsi/scsi_mid_low_api.rst           | 1174 +++++++++++++++++
>   .../translations/zh_CN/scsi/sd-parameters.rst |   38 +
>   .../translations/zh_CN/subsystem-apis.rst     |    2 +-

Would you mind splitting the patches into a patch set,

with one patch per file? I think this would make the

review much more convenient.


Thanks,

Yanteng


