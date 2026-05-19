Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E319348C63
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 13:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198833; cv=pass; b=F3oAsmw2f5s3/+rQTBgyJEP8+PdZKpRBdbXTLt8E0t1FKgr7iHVSk32/GNUytNVo1wBYZuLDHHdmX5bAv6Rl1meazF/NvOdVNY2z4qk9eEPau/PWkaCxDuBRwCWAoZTnpIXv+seUfynZPqa3gd5mD+Xkl9bRbunsR/CTH/CIkqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198833; c=relaxed/simple;
	bh=QJ4KJ/g3fInpA9dxwtg4On7IOQL0oq1w0hyYLSGGBq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AidrWOk7Ly4QYV8FJhNoZlllWfeCIurRekH99R3f/XHHuG8VNTo5QU3mHC6fz/bLZmdMspqfmCRjqUKqxuJuOfn/AygSQ0h6izvGM97/aqzHCBoe1dL8Q947v5My7uNlgI4M+8y7tSqdJjgMy2xk4JcM/B8d1h4AuWAcFesM72c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DX90TopH; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DX90TopH"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-44509921fbcso2217010f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 06:53:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779198829; cv=none;
        d=google.com; s=arc-20240605;
        b=EPYkyasrlXDSE8z3qnp4pE+TcVMcjsjGDJntQaFI3ZAFcx9z1S077qF2MlT0xqgn1x
         aSNolLXYnReeNzFHGvvWoWGC32XwCDrshlGZC3Hm/XxD96lienZ2Ui094xdGH+DcyIxh
         73WhnnrKpb0aIiL0pGYIdte6kBEy7wVNxrlxSrZ2ri8vdlobObBvYJ3ClOelzsjrin92
         VdB/IWPDRNGnyPzyloHL15TZs3MpJDqQKBGGM4q0koSw0RzpGOvMsSjmodMddZCjrRco
         nXuSzK8f9GF3hWzVo6FamrjX1AL6P3Rv/KQ6cMNkI1kNHrLDtrO7zhVwgtycMUYsc6LV
         gj8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n1LQyxnpPi+Z+D/FQN9BLFSwJyyBjmHjXirs065b7UU=;
        fh=6nHPE+99szU4ma/363wB4kMZI5voqun/dtxoJA/e55M=;
        b=SlZ2TbrJbM11EYVbSxNR0POfrK5/n42G9/hWExTrHEqAt6PZdfzpYEm+HjenBnapsv
         Fsm+cD/8/yDgeaOiUlP+Th5FU469FpBTCqGXEtlLHej1Q678VvVv1D0xr1PjbpsQYmt/
         tRg0vwdztSBIaldKllPAgzYv7gkjozelpnmkcpv2QkbWAW7VGJHQRpbLj83abWSJD4eK
         AXAnuKa9dCkvNKXblf8oztX83Kz/jDqTxnVmVUySsxSQE/skoS1gc7m2R6d09C4KodXj
         hIwRCRc21S4wJjdT7IAK7h4X1MEiBalLklVnNmGIKiwBMOgxRL9gceNbOH6ZZjAwE5EI
         zW/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779198829; x=1779803629; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n1LQyxnpPi+Z+D/FQN9BLFSwJyyBjmHjXirs065b7UU=;
        b=DX90TopHjSFbpsklCAD6h/VLmzrMcGBksx4fZS+T3Qu0V+HwH4hBRw4bYjVORB3t/Z
         QVU4rELXUFMd5SFX3n/YKHPQbeFDHwebe4Hm8RUK+KInuv4t4EjcMuKwlgyh008FdO/V
         uA9HdF/muHZpRpmGyPVCQP4RbRMOEbDzazSihsm5RPJcIuKtODxgUGbHH/PA39AhgqGa
         clJuTpNVomY0M6RDR+2EEQx+ImplURJ2ZXeFMYog3HnaVl1cORNguts16LOjZCi0TPn4
         AOxDx/gjfRfmaIlhfZgDKsnkcety4MdWFXHbYW5DdEk79/bOwnwG9/jDBtP2rOenWjHo
         yUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779198829; x=1779803629;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1LQyxnpPi+Z+D/FQN9BLFSwJyyBjmHjXirs065b7UU=;
        b=FMHRPDXjpLXy23BOC6XMxpH6VsPuoaD/+Gp1IvY9rqQYK9hWIbCaoNI6nkpHBvWs5x
         L36x50A+jXZjbunqbq12jPTS+4Ma6vDmqjzgxWqR9nBBSj+RpZXcm2FW8onTEcGrpfa6
         V2O3IrW2EspUS3mFbmXIbjLBdnr9qn2WvZRwuP7uo5+BeqLzlA5KYwb6aePyA5eAoIi2
         ZSvLFQMIU+nqbkA+/U/O5wyZO2GQ/46crzIr0YWg2bfyNupeIPoyjgVVOTg3Tr/mdCwB
         v7F1xO5E92q/oJ0bSh0rqnGIxN6YWS4LrzhojDUZj51NIcBzuylsaZsTbnEoFEKrgRVZ
         ANRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+u3IC3a382wbUDDegoesLk8f6+7KWfVgmo4ks8X2knIFhWoT2Iq1G26mmFdd1JcFYbrYZK2/ivWxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjwIjKzgvru9pXUSrC78dDrRCRLiDRTvUaWIpIZ1Hrh8M3n2JA
	Q/0xpsxWO9BrXAQLZSnW6nNx30JhZC0byI1tVQjqJl9IOGtO5FlMusAiTG+MaJKB9/+YuIZrh7l
	kWmk6/YOTj7bHumqmI1/nZpDH2Web6Lk9wkqVE1g=
X-Gm-Gg: Acq92OE76EtlwwtunBBMPR9YrwsE/cpxNaJyGmSwUIQzfeD+WNXp9n2sw0VpWoV2/8B
	5FtzdyY9wEgav7Kr8i5ZlW++56w7Sfa2pKShomArPBU1X0bjg8IRIRBpdet1/4MgGy1p7n/OdaY
	6Z7L02X7j3xA6JI3zClvmBao5j+AtU/FWxwPRLmdlmzXuRD0mOpN4Oq4eBVLNe1Lxsxh2gmOIFY
	+mpmUU1PWPNSmUXgaGkTEzDi+yCyQxV+dX1rIvl8vuzSMWp6sPDTAaHYG97/BS7Kgs76OHV9v6+
	TB3+VnQmKUxSe6c6G28n
X-Received: by 2002:a5d:5d0d:0:b0:43c:f583:126a with SMTP id
 ffacd0b85a97d-45e5c5a0cf8mr32574801f8f.14.1779198828486; Tue, 19 May 2026
 06:53:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510182856.17569-1-aayushpatilsch@gmail.com>
 <agxW8An7fRApCY1r@codewreck.org> <CABc3pKGKCLydod2NOgETP-z0T5BHep8hyy7z2UF3o+DrWEh5yw@mail.gmail.com>
In-Reply-To: <CABc3pKGKCLydod2NOgETP-z0T5BHep8hyy7z2UF3o+DrWEh5yw@mail.gmail.com>
From: Aayush Patil <aayushpatilsch@gmail.com>
Date: Tue, 19 May 2026 19:23:38 +0530
X-Gm-Features: AVHnY4JUcQHxE5CA2_Z-v_KfhWRQX-KRwhVLbvEnNr1BdXF7V1KcN6mL2SfXxH8
Message-ID: <CABc3pKEY8QvQzWPeU9QGBFG1dtGSdseTRdXF_5MUX1MeNBV5QQ@mail.gmail.com>
Subject: Re: [PATCH] docs/filesystems/9p: fix broken external links
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: ericvh@kernel.org, lucho@ionkov.net, linux_oss@crudebyte.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, v9fs@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dominique,

Thanks for the review! Yes, the trailing S is a typo.

Regarding the replacement links, should I include them in v2 or leave
those entries removed since you're not sure if they're the same files?
Happy to go either way.

Aayush


On Tue, 19 May 2026 at 19:14, Aayush Patil <aayushpatilsch@gmail.com> wrote:
>
> Hi Dominique,
>
> Thanks for the review!
>
> Regarding the replacement links, should I include them in v2 or leave those entries removed since you're not sure if they're the same files? Happy to go either way.
>
> Aayush
>
>
> On Tue, 19 May 2026 at 17:56, Dominique Martinet <asmadeus@codewreck.org> wrote:
>>
>> Aayush Patil wrote on Sun, May 10, 2026 at 11:58:56PM +0530:
>> > The xcpu.org links for xcpu-talk, kvmfs, and cellfs-talk are dead
>> > with no archived snapshots available on the Wayback Machine, so
>> > remove them. The PROSE I/O link redirects to a dead server; replace
>> > it with an archived version from web.archive.org.S
>>
>> (I assume the final S is a typo here)
>>
>> Eric, it looks like you're the one who added these links, would you
>> happen to have a copy around if you care about keeping these?
>> Otherwise I'm not sure of the value of listing the papers without the
>> actual files available, but I don't mind either way.
>>
>> I agree dead links are of little value though so will pick this up if
>> there's no reply in a while
>>
>> >
>> > Signed-off-by: Aayush Patil <aayushpatilsch@gmail.com>
>> > ---
>> >  Documentation/filesystems/9p.rst | 5 +----
>> >  1 file changed, 1 insertion(+), 4 deletions(-)
>> >
>> > diff --git a/Documentation/filesystems/9p.rst b/Documentation/filesystems/9p.rst
>> > index be3504ca034a..65809a1dad21 100644
>> > --- a/Documentation/filesystems/9p.rst
>> > +++ b/Documentation/filesystems/9p.rst
>> > @@ -23,13 +23,10 @@ the 9p client is available in the form of a USENIX paper:
>> >  Other applications are described in the following papers:
>> >
>> >       * XCPU & Clustering
>> > -       http://xcpu.org/papers/xcpu-talk.pdf
>>
>> I found http://mirtchovski.postnix.pw/p9/xcpu-talk.pdf but I'm not sure
>> if it's the same file
>>
>> >       * KVMFS: control file system for KVM
>> > -       http://xcpu.org/papers/kvmfs.pdf
>>
>> Looks close but perhaps not the same as
>> https://www.kernel.org/doc/ols/2007/ols2007v2-pages-59-64.pdf ?
>>
>> >       * CellFS: A New Programming Model for the Cell BE
>> > -       http://xcpu.org/papers/cellfs-talk.pdf
>>
>> Couldn't find anything fo this one
>>
>> >       * PROSE I/O: Using 9p to enable Application Partitions
>> > -       http://plan9.escet.urjc.es/iwp9/cready/PROSE_iwp9_2006.pdf
>> > +       http://web.archive.org/web/20110101152020/http://plan9.escet.urjc.es/iwp9/cready/PROSE_iwp9_2006.pdf
>> >       * VirtFS: A Virtualization Aware File System pass-through
>> >         https://kernel.org/doc/ols/2010/ols2010-pages-109-120.pdf
>> >
>>
>> --
>> Dominique Martinet | Asmadeus
