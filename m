Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C0C34A799
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 22:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776809644; cv=none; b=py6ouI0dt7YtUw7Z58q+m4g8YQJ8RT5Q0rgI6VLYmn1inh6QR1PIi3j/ARa1rX1EU/wbJqYb1J1+87QkWamDX6l+LjdVm1tJ/8747eq+ooy3OUPKW5ypEUhuVinmd58FVaxWiT+ydvjI+JZVsCj95KU4m/G/CR9KASbz+0+C//A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776809644; c=relaxed/simple;
	bh=Iu5XAN4ycbBpopEF1eWkcWzsBYF1UWk4/bNXchE4nLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=isEXRfO5wEDN6GGx2BHaf3BolWT/axLus0l/TLUeOr0X85DBRsxUtY64pNcpQo7XlPSmLC0/wkKefolWKS0ecNm2Nwoa39dCy7S4vmb7lc+XINf+5RB8hvStGx2WmSyl8JykJMjFS4LpL48Xo2D7bUvyC0P4LLXReEyIxNwJ5KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=mGAipuk+; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="mGAipuk+"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cb40149037so484494285a.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 15:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1776809642; x=1777414442; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wrGysjxDZE2kLSR6t5QtYa+yFecZADsz4QmGJDAHoGE=;
        b=mGAipuk+GvJ0tVEw1KrJcm4c9gIJEBY6AMtokHH1bDWWDj1/2PT3DiH8B7oSJGeQ8b
         QqakMNx9rBgnezQr+8UPdorqMYCCL7KLyIEjciyyEB5L1UrzRZ8ZOuFv1CKvbDK+0DAK
         x/FpvCPK/7Q57igcdl+LQEoyG7+tLK9m209sdftTGLTLyzoG+9kuXGCVHAPfbOVys9tH
         9fGN3r31xcB8nPPWOqi4PSJd+sr5a+5nBbEX49lKbitrD6tKdiGgslHXXYir1ZNuxd/V
         ksnrxsQOKNYhn3TY9948F02CiF1jCsn83EV5C15HpVK8HTDMHF+B3MrwuFR3ODoRlB+0
         M+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776809642; x=1777414442;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wrGysjxDZE2kLSR6t5QtYa+yFecZADsz4QmGJDAHoGE=;
        b=nS2dqlh3oLRw0VAjcK9Fa6twkYmLBcHUCHBzaX98w1sdO4eF96bm1MKl3TB46vzMAf
         wbLPJO20kG6oRfiaFjPE7/6xrA5ZdEwJBC2oi8yjqlQlStg90Jq7zUA3sb/WJVYbvUFi
         GuPfzrAqFHZgaXQtc0qdVr+Cy6D9DeHOPe4LKmLe2/3XyZqSr/HMccqRLI1xJmDq1CYG
         hGaS6jYutwPmcSWF4m42hRPHQwR4LJ/4yOYNKgZColJkZojWSm2kgffR2UcNn+EVua6a
         zvLQLYtGhVlH/5vR/5bp9O0VC52tA0ATHLKJcwfiUKn7gech19oGegf7YchhHnnSazWj
         N5UA==
X-Forwarded-Encrypted: i=1; AFNElJ+BbT57ZYd/sCFo+WAwLr4F4hDY2tKimvVO03smsjfE93XoS4v44GdkzVR50OEnVjzmUymc8QT3CmE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKMF9jWoytRMLyXpwsHNz+uim2s/3KXPYRFghw/TAfijGEfg2J
	Pj6QJbc2QjPo3538kwfT1xkcBKGAPO8u4KleixayOmFjLBaadgRUKBMnsf2XtiGcZ6k=
X-Gm-Gg: AeBDiet7bEp7Pdbi7QnoIHyP+SeZsmO3YPJNSKTMME/vXliY2sDS/fh52qQed9UgA25
	626p8iGf84hGmekouHJnAqb0Pd2aM5WpxHGe++jNUXy+8JRiK+kzOzMXW8H54JPnl/ZVUmi3Opx
	Tc1QYLrIOtYDNsbOurK0qQpOin8PiDvmtaTSNtMPc2xKrg96s+qsbCFEIlf5VrefOHPVNElmb/i
	rw2Os+pUMLARuzgwf4O0UyzhQxYO+ubNZx335vJd28gm2V0SSc/a1EXtS7P4jfV7beXWpJZG+tp
	7zOLavR2HeqphCZGiZJqaxzldalk+vqFeutfGX/VmLOLs2lXYo/9aw+U0nG1yhtFjWyh32pJDJj
	Jsy3fwil0kQ3NLF+HZvfarMag6hsYXE8RKaFD83v6dddsa9kHQJjh+ZhOA2JkdqPUWLexpBw4WV
	cz375S9ehxCcMQCddnldHEG90DgqJYpi/rGynOX6dUnI5xc9tw8TjSI7S4hRmnxsORPPQ9pw2/u
	Wmi0bISUJ1zQuUV/Q00
X-Received: by 2002:a05:620a:2844:b0:8cf:c1c2:90f with SMTP id af79cd13be357-8e78fa1ebc4mr2786943085a.7.1776809641667;
        Tue, 21 Apr 2026 15:14:01 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-71-246-228-50.washdc.fios.verizon.net. [71.246.228.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ebce6ef86dsm515161085a.30.2026.04.21.15.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 15:14:00 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:13:58 -0400
From: Gregory Price <gourry@gourry.net>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: John Groves <John@groves.net>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Bernd Schubert <bernd@bsbernd.com>,
	John Groves <john@jagalactic.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Bernd Schubert <bschubert@ddn.com>,
	Alison Schofield <alison.schofield@intel.com>,
	John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Stefan Hajnoczi <shajnocz@redhat.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Chen Linxuan <chenlinxuan@uniontech.com>,
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shivank Garg <shivankg@amd.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Aravind Ramesh <arramesh@micron.com>,
	Ajay Joshi <ajayjoshi@micron.com>,
	"venkataravis@micron.com" <venkataravis@micron.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	djbw@kernel.org
Subject: Re: [PATCH V10 00/10] famfs: port into fuse
Message-ID: <aef2pvhIEdvvgfDF@gourry-fedora-PF4VCD3F>
References: <CAJfpegvVTcV89=q3L326aGQjhduBcv7PVg5QKftGLjNZmCLmaw@mail.gmail.com>
 <ad4_jFsR951c2Mtn@groves.net>
 <20260414185740.GA604658@frogsfrogsfrogs>
 <ad69tTnx5YkD4Y9K@gourry-fedora-PF4VCD3F>
 <f254f6fc-dc06-4612-82d7-35bb10dbd32e@kernel.org>
 <aeUU8hMwPij2WvfF@groves.net>
 <aeVy2MzucnrLlOQx@gourry-fedora-PF4VCD3F>
 <CAJnrk1ZpPS9rOoBqOBRsqTu0Zgk=aoYzpYZ0mAVDCoeewtLhcg@mail.gmail.com>
 <aeeJ8Lgg2z0X-NC_@gourry-fedora-PF4VCD3F>
 <CAJnrk1Zd2RFE=z=sPRCHaBdqK40+23Vv_owS=7OfxYF1TtPomg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJnrk1Zd2RFE=z=sPRCHaBdqK40+23Vv_owS=7OfxYF1TtPomg@mail.gmail.com>

On Tue, Apr 21, 2026 at 11:59:15AM -0700, Joanne Koong wrote:
> On Tue, Apr 21, 2026 at 7:30 AM Gregory Price <gourry@gourry.net> wrote:
> 
> I'm not sure if this addresses Christian's concerns or not, but the
> blob would reside within struct fuse_inode not struct inode. I
> definitely agree with him that this should not touch or add any infra
> outside fuse.
> 
> I hadn't heard of bpf arenas until his comment. If the hashmap
> overhead is too high for famfs, having a custom in-arena hash table
> would be much faster I think, as it could be designed to require less
> pointer chasing and avoid other overhead in the bpf hashmap
> implementation, though now famfs would have to manage the data
> structure and complexity itself.
> 

I think if the fuse-inode blob is acceptable, that's highly preferable -
and it wouldn't necessarily need to stay specific to bpf.  If there was
some generic format that folks agreed on as a baseline, that could
obviously be worked into the interface.

~Gregory
