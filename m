Received: from sg-1-23.ptr.blmpb.com (sg-1-23.ptr.blmpb.com [118.26.132.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6846D34E741
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 17:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762448781; cv=none; b=W1wcCUDtTI+IFc8t26EJqb/EAV3SrYlwPA3Fi1jmMS6AKQKYZC5Ykll67qSUpzpyt1Bc26WMbmRYIOfwdIYD3gd3BS+iCCsy7YAmG9d13vqGA1wVzJfOzW+0vPWdSPiNijDxHsdlYhVmf0ENQsy9ORH1ucjFcRkV8Zq0hH+7ntg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762448781; c=relaxed/simple;
	bh=feCa6VUsW/nBHuedQ4gLtAXKsZ+WRYxs+1mOE0fpfTA=;
	h=Content-Type:To:From:Message-Id:In-Reply-To:Cc:Subject:References:
	 Date:Mime-Version; b=R2xjtjX2ypISejqKHIXVbvTyudMmSN577Utwzmug3zPz3M3iOBAAjedCFUzkvKfnDNMi6RlncCk+44+B+tBYNhoPFWlCN8PEcesoxnKkOP4/MtSZeR2LZpD4cfCBTbISM3NyjKcG/QsfrYwPp/dRJYc9hBPzNY+dfQIaity39iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com; spf=none smtp.mailfrom=fnnas.com; dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b=36aWqGg5; arc=none smtp.client-ip=118.26.132.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fnnas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b="36aWqGg5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1762448766;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=feCa6VUsW/nBHuedQ4gLtAXKsZ+WRYxs+1mOE0fpfTA=;
 b=36aWqGg5Lk9MGTKi1dGVYeuoXujOQ4vq1wVS4PK0YnHejD4nn8u3/kna0bBba/Ut1Rhxbp
 xkc9QJZVwk+ihiepJ916GPCNGVp/+JkMNVn6YjBCsFYRfawSjz73/ZFd2XJS7vOZzfY/y+
 EjqOGsqe7ISA+VR98fkkBTrfOcSLPWUL5z/IcVr6mGpmKlaz+a4pAGXB3M6lleEAs2vcCt
 WuufI0n+TmuPa54U2/WjeAjb8QK7cjwgr393cLAwWr2mFQY8dwAWfTK3YforCVeKt2Bbha
 Bi+pG5VLCkgZ1W8T1exhDOk1/qFi1Uvxi4fiQyPzKphR2aaUuX/s/xTnTDjSbg==
Content-Type: text/plain; charset=UTF-8
User-Agent: Mozilla Thunderbird
Reply-To: yukuai@fnnas.com
X-Lms-Return-Path: <lba+2690cd57c+b3e609+vger.kernel.org+yukuai@fnnas.com>
Content-Transfer-Encoding: quoted-printable
Received: from [192.168.1.104] ([39.182.0.168]) by smtp.feishu.cn with ESMTPS; Fri, 07 Nov 2025 01:06:03 +0800
To: "Xiao Ni" <xni@redhat.com>
From: "Yu Kuai" <yukuai@fnnas.com>
Message-Id: <8e240c3c-3cf7-4d48-8e13-2146a5d36c2b@fnnas.com>
In-Reply-To: <CALTww29X5KizukDHpNcdeHS8oQ-vejwqTYrV5RFnOesZbFhYBQ@mail.gmail.com>
Cc: "Li Nan" <linan666@huaweicloud.com>, <corbet@lwn.net>, <song@kernel.org>, 
	<hare@suse.de>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-raid@vger.kernel.org>, 
	<yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: Re: [PATCH v9 4/5] md: add check_new_feature module parameter
References: <20251103125757.1405796-1-linan666@huaweicloud.com> <20251103125757.1405796-5-linan666@huaweicloud.com> <CALTww29-7U=o=RzS=pfo-zqLYY_O2o+PXw-8PLXqFRf=wdthvQ@mail.gmail.com> <a660478f-b146-05ec-a3f4-f86457b096d0@huaweicloud.com> <CALTww29v7kKgDyWqUZnteNqHDEH9_KBRY+HtSMJoquMv0sTwkg@mail.gmail.com> <2c1ab8fc-99ac-44fd-892c-2eeedb9581f4@fnnas.com> <CALTww289ZzZP5TmD5qezaYZV0Mnb90abqMqR=OnAzRz3NkmhQQ@mail.gmail.com> <5396ce6f-ba67-4f5e-86dc-3c9aebb6dc20@fnnas.com> <CALTww2_MHcXCOjeOPha0+LHNiu8O_9P4jVYP=K5-ea951omfMw@mail.gmail.com> <c3124729-4b78-4c45-9b13-b74d59881dba@fnnas.com> <CALTww29X5KizukDHpNcdeHS8oQ-vejwqTYrV5RFnOesZbFhYBQ@mail.gmail.com>
X-Original-From: Yu Kuai <yukuai@fnnas.com>
Date: Fri, 7 Nov 2025 01:06:02 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0

Hi,

=E5=9C=A8 2025/11/6 22:56, Xiao Ni =E5=86=99=E9=81=93:
> On Thu, Nov 6, 2025 at 9:31=E2=80=AFPM Yu Kuai <yukuai@fnnas.com> wrote:
>> Hi,
>>
>> =E5=9C=A8 2025/11/6 21:15, Xiao Ni =E5=86=99=E9=81=93:
>>> In patch05, the commit says this:
>>>
>>> Future mdadm should support setting LBS via metadata field during RAID
>>> creation and the new sysfs. Though the kernel allows runtime LBS change=
s,
>>> users should avoid modifying it after creating partitions or filesystem=
s
>>> to prevent compatibility issues.
>>>
>>> So it only can specify logical block size when creating an array. In
>>> the case you mentioned above, in step3, the array will be assembled in
>>> new kernel and the sb->pad3 will not be set, right?
>> No, lbs will be set to the value array actually use in metadata, otherwi=
se
>> data loss problem will not be fixed for the array with different lbs fro=
m
>> underlying disks, this is what we want to fix in the first place.
> But the case you mentioned is to assemble an existing array in a new
> kernel. The existing array in the old kernel doesn't set lbs. So the
> sb->pad3 will be zero when assembling it in the new kernel.

Looks like you misunderstood the patch, lbs in sb->pad3 will be updated to =
the
real lbs when array is assembled in the new kernel. Set lbs in metadata is
necessary to avoid data loss.

And please noted this patch is required to be backported to old kernel to
make it possible that array with default lbs can be assembled again in old
kernel.

>
> And as planned, we will not support --lbs (for example) for the `mdadm
> --assemble` command.
>
> The original problem should be fixed by specifying lbs when creating
> an array (https://www.spinics.net/lists/raid/msg80870.html). Maybe we
> should avoid updating lbs when adding a new disk=EF=BC=9F

I don't understand, lbs modification should be forbidden once array is
created, it's only allowed to be updated before the array is running the
first time.

>
> Regards
> Xiao
>> Thanks,
>> Kuai
>>
