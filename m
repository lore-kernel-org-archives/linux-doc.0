Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C88337B92
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 13:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769001418; cv=none; b=aeXEhW4A87yC7bE4tEPl9drEYjD6XFeLqF0k0m5uiXzY1Uqvqjk1DWT4PF1fJxej61qXtzsTpPK4YkSa+1iMY7UHzmtjyXj7AchY0Sx7NtksZLyCMaxslHr+XF1oMflNWYSPElWLPhJ2PaFo7bbhaeBF4lSkM8NO1zTVw3remq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769001418; c=relaxed/simple;
	bh=O1n0PREBPOQbxUvYlP+7R8SoBMrN6iyJKN8UrrPPohs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=fyam/M1rRqnwTLrS63tag6BSC681yIoMHvi/CjSXjE0YNj+fVLxgGHRGtdptDMo8owt2RJmV+hjTQ6KTOzu8kQs+HVfa29V3vhx01MA7KioBS0ca0DsICXqW3GsfDR2m5kGrFSu/skyHV4NAwy/vCPE5WLHB0dpX/jI6jiKJhkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FsAcWNbU; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FsAcWNbU"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b71557299dso705800eec.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 05:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769001416; x=1769606216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O1n0PREBPOQbxUvYlP+7R8SoBMrN6iyJKN8UrrPPohs=;
        b=FsAcWNbU6g7uYAf/96wmq1xYvzb/s8ZWFxHcE2tGglAsGyxL3yM3cTEhxol8YAGkXA
         y1upEjngfL/eJe6F2YAhIRB9zv212yvSU9w6m0tR+kPoWtJ+VGa1TDuSqKnK3frHKKKE
         7BOEbH1GYuusOkkf+SIme7My6oBSHHEyclcEI/zlftdJrcd7/J2cH0oDkeAksUo6dKAH
         /cSxY2zzHfGLBQYFa4w9jLog+cAYpcE2lItt92m790Lxdhz8TXWd+3UCXVjcykitnhCg
         Vwr7B2SCPgC6n7cX0UQWUjk2MIiY5LUP+gn4ndF5/uJYmY7DEetC7qCAJafDdMmMQY4y
         g/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769001416; x=1769606216;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O1n0PREBPOQbxUvYlP+7R8SoBMrN6iyJKN8UrrPPohs=;
        b=YkojuuSD2/DNTUMFWmN/SPr6ELlaLiBm3yqecv1N4aui6hVeSK+igUbHu2AmPM1ijH
         A8QMWsKX70J5GVOQ8l/jsHunLxc0UCSfcgwSM14Tx6jeeskZVlUBIMsNeCrhuMfy4SI6
         EK84/cjFr+fkMHgbJ31JTIhEIGLT0GxIt737EVCEYjVy8KpDL4vAI27Tr+UHQUKuuV28
         ZdI3jzb2+qfMcBnac5fvDTdYiJAUqRDA856TZqQ4vxuuanQrY8UbMQZ7FAbKgENLlpOQ
         JTXIAoCO3prmTuQyzz8n0JcbhYI33/B/4DyG+Mmtf6X1f3tnlGtxnESPy6bsD12scm3Q
         6ryA==
X-Forwarded-Encrypted: i=1; AJvYcCXjgJZc7QdgN/ebRxQKTvlLtHoIo/D2Nzk0s1xpjKG8p7nM0WKOrwNKj8lA7JnonYffc0W1GpMy2ws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1u4VCM+4ohioyqybZVgZDMlhcp60x9nJb3aP+RoCczlNBgmsX
	0Solq3lIRY/KZxWIHgeyvl/+tlJZLzobARzxuJV2GgPUzyvlxuyRN4mN
X-Gm-Gg: AZuq6aICIZVBPjCG3cFwFCxPOyQKwahTkziCHrlJED+nQecMKsUaYWK4jN6PHKQAggK
	uErTxq2nnLZ+129tjtNNeavDQy9xpHUciuBP+MwbZHk4n7CUakGW4QItF+3SbxFUy554TTZsr2I
	fxIleJNXwGY5WpFKV6ixdPeQAwAZs9Gov7zt8rrewwSMOQ80Rg3Ylj5f9af+NAHncJ04pMEQu+g
	FJDEbR/hvRrikNJzurSJSEv6n2Gyl3/viuYKcMDrr9TO09o8Kc1769dOBJ1J+rF67hk+VD/VsyM
	mInoyCJvgeCtC295lP8p22V5IjAt/O6406vjdfOSqfoLF5BCwMeFB+P8nJZ3quuM86UhNPryIUN
	aqacjQi3SdO7DXrRAfpElKYqz+U2oCV5U6eJIgIqqM8wAfU87nIAKQSCcph4xzArBKFwJbaffpp
	x7jbwARASDR2AFT5iC5uHDcQdwHtlQGOVYRQJQL2wRMh39MszTUZxbWqbRfWvDBs2tB6PRC1wjE
	igcdNsi0w==
X-Received: by 2002:a05:7301:7c0b:b0:2ae:56d7:b02 with SMTP id 5a478bee46e88-2b6b46c6449mr12795377eec.9.1769001416023;
        Wed, 21 Jan 2026 05:16:56 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b361f5d4sm21106381eec.17.2026.01.21.05.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 05:16:55 -0800 (PST)
Date: Wed, 21 Jan 2026 05:16:55 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>
CC: Benjamin Tissoires <bentiss@kernel.org>,
 "Limonciello, Mario" <mario.limonciello@amd.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_02/16=5D_HID=3A_hid-lenovo-go?=
 =?US-ASCII?Q?=3A_Add_Lenovo_Legion_Go_Series_HID_Driver?=
User-Agent: Thunderbird for Android
In-Reply-To: <24on5sn2-2726-84q2-635q-9245n343qqrp@xreary.bet>
References: <20251229031753.581664-1-derekjohn.clark@gmail.com> <20251229031753.581664-3-derekjohn.clark@gmail.com> <0on4p9s6-7512-9408-49no-3292o86113r3@xreary.bet> <6BB4F74A-F440-4F21-B094-62CFD18C599A@gmail.com> <2910bb2e-6b31-42f3-a3de-463327b16ff1@app.fastmail.com> <24on5sn2-2726-84q2-635q-9245n343qqrp@xreary.bet>
Message-ID: <8693204A-60AF-48CF-B453-446ABADDA46C@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On January 21, 2026 1:08:18 AM PST, Jiri Kosina <jikos@kernel=2Eorg> wrote:
>On Mon, 12 Jan 2026, Mark Pearson wrote:
>
>> >>I am now almost finished with reviewing this pile and am planning to =
queue=20
>> >>it in hid=2Egit shortly, but I have a question regarding the MAINTAIN=
ERS=20
>> >>entry above=2E
>> >>
>> >>The title claims support for all of Lenovo HID, but there is much mor=
e to=20
>> >>it than drivers/hid/hid-lenovo-go=2Ec, specifically in hid-lenovo=2Ec=
=2E
>> >>
>> >>So either please make the title more specific (or claim the ownership=
 of=20
>> >>the whole Lenovo HID landscape indeed, fine by me, but the please ref=
lect=20
>> >>that in F: :) )=2E
>> >>
>> >>Thanks,
>> >>
>> >
>> > Hi Jiri
>> >
>> > Sure, I've debated using LENOVO LEGION GO HID drivers and LENOVO GO H=
ID=20
>> > drivers=2E Do you have a preference?=20
>
>Either works, as far as I am concerned=2E
>
>> > The other drivers are pretty old and I don't have any hardware that=
=20
>> > would use them so I'd prefer to keep them separate (though I'll=20
>> > acknowledge that they don't seem to have a MAINTAINERS entry)
>> >
>> I should probably take a better look at the lenovo-hid driver=2E
>>=20
>> The platforms that it's supporting weren't in the Linux program, so it=
=20
>> never crossed my path before - but looking ahead I think we may need to=
=20
>> contribute some changes there (guessing a little, but I'll know in a fe=
w=20
>> months time)=2E
>>=20
>> Jiri - as that driver is targeted for Thinkpads, I'm OK to take some=20
>> responsibility for it if that is useful/helpful=2E
>
>Perfect, could you please then either send that as a followup patch, or=
=20
>even have it included right as part of Derek's series?
>

If Mark is okay with it I'll just add him and that driver to the same entr=
y=2E

I'll wait a few days to send a v2 in case there's additional input=2E=20

Thanks,
Derek

>Thanks,
>

