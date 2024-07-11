Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D311B16088F
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 15:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720710262; cv=none; b=StbBjDHAZC9pVlklohdTN5EavKx+NgeuZTt0LGY2LfwVY0sn9TmM4/Z8tbaqz5NgQ3bvhUmxOPcmOl719otiw7+m2Z/odO39FLNi1xvINNkOISNSB2DwYWV6vR/i1NM4Q4fnohBcYSjB3cR3CTOD6SnThVaODeQgseZ/CiPqOT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720710262; c=relaxed/simple;
	bh=RIhfOzVcXIy7+AwNsdNPGSuaq68Hqj9Gr8kJENzAlEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XTMy6ES0r5XRKwKEz8BRmP+/khkis26Rxpr5KtiLSBj2cxTAXk4cEaT3ySLShHIloMNjI61oFZGYqVfiInud4FoS0ODkR0Weo3ky9YXtDi0SpCfY1cgRrZYIwh0Es1HTuPUWdrKyyANqs07ekvOnpeVs16L+w0GoJH4KBtOqHko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IrND8y6+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IrND8y6+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720710259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rbObYPlRhGPWJEjqZQKRQutm+8Td90FVq4wxYtGGsgM=;
	b=IrND8y6+DHaR4F+9WxbTraTcxB5sMqXXh9/R+Rof11EA55mK2zokgSH0xU4UQYlXAeZuo1
	XIRknX8NMOSCWdW/+lEZLca9tIgQaD0xvZbhAXoiznoWSaXMVITed+yt3khZHbJ0AKmCpo
	TClpaQp1NgpWT+6c/WGYaCrtM6prNDg=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-93S2O6U-Oh2IMOq4wK8HwQ-1; Thu, 11 Jul 2024 11:04:18 -0400
X-MC-Unique: 93S2O6U-Oh2IMOq4wK8HwQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52e960523ecso956210e87.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 08:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720710257; x=1721315057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rbObYPlRhGPWJEjqZQKRQutm+8Td90FVq4wxYtGGsgM=;
        b=N5kWzY1cnGHuMBWTWUCPvfErdLnVuFtVm03s/M8YGGuI2f5ya7MPzBdmjlaJevBmzJ
         dJSHtOOkH8Bwk1l+zaUIEgHqXrYD/wufMwMPO+RVo4Vd0WPIktpuysokcw45/axfCrUF
         ltiPUg1FJtV5IwR0r+GTW+w/RzWbv8ryxr40skW77tdiRoHVS6Al0cQ8O1R+iz7Pr7p2
         Swyy0VgFl6Ow9hRZL5/0c1ElFjp2XtbxudmexxchgzJroBWuRDVIfeBAKHb+KUPq1TsN
         dVEqDPzDLl8F7tS90P7g4JtCEcI5TT0giRaRRdbDx/A9+M11jJ+HVUPw4lInM/nEZuTp
         5mVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSymjthqeZM2o82t+KyseV1h/pCGNlIRPdXd+Pc7KyAuPKhlSA8togAhmeDVsnBkZPFopqUHdBlvzGW6iLLbq8/BS+2Kj/33du
X-Gm-Message-State: AOJu0YwFAPX3O2BuKD4SlFVlul7cvivv6fNiERL9CwZU7+VMC70+yQTU
	J1nFyBVpwiIY74yOqqkx8Cl1fwqz8I8jqBsrO0huptBMkMCly18jIvV222MCYpvYhZ0nnmn9pkU
	/j5ZFdZ906nx8DnJL5U+quNi6eXlFZaAcZiinRFhmwGjh7Y8FyHTt8uqPxw==
X-Received: by 2002:a19:915e:0:b0:52e:7f16:96be with SMTP id 2adb3069b0e04-52eb99d4ec8mr4550987e87.65.1720710256759;
        Thu, 11 Jul 2024 08:04:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZslfRADh61h2K4U2I0v8TWlsmuDejSX07DbIntDk5o01Hp5GIPBHFAcNOq0qN0Q3YbDMbqA==
X-Received: by 2002:a19:915e:0:b0:52e:7f16:96be with SMTP id 2adb3069b0e04-52eb99d4ec8mr4550931e87.65.1720710255957;
        Thu, 11 Jul 2024 08:04:15 -0700 (PDT)
Received: from ?IPV6:2003:cf:d74b:1cd5:1c4c:c09:d73b:c07d? (p200300cfd74b1cd51c4c0c09d73bc07d.dip0.t-ipconnect.de. [2003:cf:d74b:1cd5:1c4c:c09:d73b:c07d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f74462esm118919565e9.48.2024.07.11.08.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 08:04:15 -0700 (PDT)
Message-ID: <90f0cdd6-379f-49a0-9bb2-ba86c3e8ccce@redhat.com>
Date: Thu, 11 Jul 2024 17:04:13 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] virtio-fs: Add 'file' mount option
To: Josef Bacik <josef@toxicpanda.com>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
 Miklos Szeredi <mszeredi@redhat.com>, German Maglione
 <gmaglione@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vivek Goyal <vgoyal@redhat.com>
References: <20240709111918.31233-1-hreitz@redhat.com>
 <20240709175652.GB1040492@perftesting>
 <8ebfc48f-9a93-45ed-ba88-a4e4447d997a@redhat.com>
 <20240710184222.GA1167307@perftesting>
 <453a5eb6-204f-403a-b41d-faefdbcb8f50@redhat.com>
 <20240711143425.GA1235314@perftesting>
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20240711143425.GA1235314@perftesting>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11.07.24 16:34, Josef Bacik wrote:
> On Thu, Jul 11, 2024 at 10:21:35AM +0200, Hanna Czenczek wrote:
>> On 10.07.24 20:42, Josef Bacik wrote:
>>> On Wed, Jul 10, 2024 at 09:28:08AM +0200, Hanna Czenczek wrote:
>>>> On 09.07.24 19:56, Josef Bacik wrote:
>>>>> On Tue, Jul 09, 2024 at 01:19:16PM +0200, Hanna Czenczek wrote:
>>>>>> Hi,
>>>>>>
>>>>>> We want to be able to mount filesystems that just consist of one regular
>>>>>> file via virtio-fs, i.e. no root directory, just a file as the root
>>>>>> node.
>>>>>>
>>>>>> While that is possible via FUSE itself (through the 'rootmode' mount
>>>>>> option, which is automatically set by the fusermount help program to
>>>>>> match the mount point's inode mode), there is no virtio-fs option yet
>>>>>> that would allow changing the rootmode from S_IFDIR to S_IFREG.
>>>>>>
>>>>>> To do that, this series introduces a new 'file' mount option that does
>>>>>> precisely that.  Alternatively, we could provide the same 'rootmode'
>>>>>> option that FUSE has, but as laid out in patch 1's commit description,
>>>>>> that option is a bit cumbersome for virtio-fs (in a way that it is not
>>>>>> for FUSE), and its usefulness as a more general option is limited.
>>>>>>
>>>>> All this does is make file an alias for something a little easier for users to
>>>>> read, which can easily be done in libfuse.  Add the code to lib/mount.c to alias
>>>>> 'file' to turn it into rootmode=S_IFREG when it sends it to the kernel, it's not
>>>>> necessary to do this in the kernel.  Thanks,
>>>> This series is not about normal FUSE filesystems (file_system_type
>>>> fuse_fs_type, “fuse”), but about virtio-fs (file_system_type virtio_fs_type,
>>>> “virtiofs”), i.e. a case where libfuse and fusermount are not involved at
>>>> all.  As far as I’m aware, mounting a virtio-fs filesystem with a
>>>> non-directory root inode is currently not possible at all.
>>> Ok so I think I had it backwards in my head, my apologies.
>>>
>>> That being said I still don't understand why this requires a change to virtiofs
>>> at all.
>>>
>>> I have a virtiofs thing attached to my VM.  Inside the vm I do
>>>
>>> mount -t virtiofs <name of thing I've attached to the vm> /directory
>>>
>>> and then on the host machine, virtiofsd is a "normal" FUSE driver, except it's
>>> talking over the socket you setup between the guest and the host.  I assume this
>>> is all correct?
>>>
>>> So then the question is, why does it matter what virtiofsd is exposing?  I guess
>>> that's the better question.  The guest shouldn't have to care if it's a
>>> directory or a file right?  The mountpoint is going to be a directory, whatever
>>> is backing it shouldn't matter.  Could you describe the exact thing you're
>>> trying to accomplish?  Thanks,
>> The mount point needs to be of the same mode as the root node of the mounted
>> filesystem, or it’ll be inaccessible after mounting[1].  In this case, I
>> want to export a regular file as the root node, so the root node must be a
>> regular file, too:
>>
>> host$ echo foo > /tmp/bar
>>
>> host$ virtiofsd --shared-dir /tmp/bar --socket-path /tmp/viofsd.sock
>> --sandbox none
>>
>>
>> guest# mkdir /tmp/mnt-dir
>>
>> guest# mount -t virtiofs virtiofs-tag /tmp/mnt-dir
>>
>> guest# stat /tmp/mnt-dir
>> stat: cannot statx '/tmp/mnt-dir': Input/output error
>>
>> guest# cat /tmp/mnt-dir
>> cat: /tmp/mnt-dir: Input/output error
>>
>> guest# ls /tmp/mnt-dir
>> ls: cannot access '/tmp/mnt-dir': Input/output error
>>
>> guest# umount /tmp/mnt-dir
>>
>> (following with this series applied)
>>
>> guest# touch /tmp/mnt-file
>>
>> guest# mount -t virtiofs virtiofs-tag /tmp/mnt-file -o file
>>
>> guest# stat /tmp/mnt-file
>>    File: /tmp/mnt-file
>>    Size: 4               Blocks: 8          IO Block: 4096   regular file
>> [...]
>>
>> guest# cat /tmp/mnt-file
>> foo
>>
>> guest# ls --file-type /tmp/mnt-file
>> /tmp/mnt-file
>>
>> guest# ls --file-type /tmp
>> mnt-dir/
>> mnt-file
>> [...]
>>
> Got it, this makes sense, thanks for explaining it to me.  You can add
>
> Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks!

Hanna

