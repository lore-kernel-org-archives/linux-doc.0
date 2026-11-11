Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383627;
	b=BDA4V34AvaFXu9kYcNCFRXHeFfcgQ843PZ2oeUcCW/zO3bUZWnvFRTSm/vgH6yU8bNvl
	 xpldm+Grr4bX5gMHb8wtZ0DI7LK7sQb9GPLSAPhBpn7kEo0BRLSo6R/rTsnXawQb7usZ3
	 QyqrmaEckxd9aerag0Ph2ktKK+YRj6Wo4yxL2tAHTAVmpFR5BbYlLr2dMUcBnaNEFAMrC
	 XSrqUqcLCigDTdryMBLAVTZn75H3m6ezK6bODVTqmh5a5UyQ/VgUwe1OXXjeVdyCBsg8Z
	 X9U7j1PZl/KMHGCXd3QS9o7BGvs3isNZvBmde5rK7b8sOsy4jCcRLjwz5YaC6Bnj1Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=dTOr68dqd9pXsH3sDySoD8YNtJ+vod0XkUHzER129hw=;
	b=PN9aezcJCNrmpfSmlTrSCOP78zB6kJxLEyE7DUtqSo7sIdwMTOT3rhDP1KLHFbJ+/A25
	 a7Msbelxt9ZQrrVyqNtnRqCIUP6cR6gYua2tiVOsu+zoJ9PX0B3G1Is4UeAdi+PMBUY4r
	 zrak767YAXaQyI8P0LroJvRWyHg6Gcud4jj6AW6XsS67Ls8oyNBPfaYIHGMh+EtMkOy30
	 TqIUobk2Xmm63Fpuxbt+v9xSVJiOXLIzYoHApfVFVPvYqDOfrIwu1Do3aRgKFX747mCrs
	 wNA30KCabEGoadpbIFjWUGuAWAaOattXLYb30h+4LgG+z8G/MZ/JUMKmF87K2jTKoow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=c2OEhHvm;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFC9606A31C
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 07:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BFC9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=c2OEhHvm
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so25042715e9.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 23:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794383624; x=1794988424; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dTOr68dqd9pXsH3sDySoD8YNtJ+vod0XkUHzER129hw=;
        b=c2OEhHvmER3+RZdFGbo6s/3sc/wn863f4xlIqCDTNcNCkBfkQMKkhrp9MIDIJdMHJ5
         gn5vAGI08jqoP/CuW2e9fdcilkN78XuU1mWqLv9aEgCHB/Mw4dz+qMVHvd5kxhmAq7Xe
         WQnWwjfTwZpAILgiIKAhoBJn8CwuHQ+7Z6CmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383624; x=1794988424;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTOr68dqd9pXsH3sDySoD8YNtJ+vod0XkUHzER129hw=;
        b=XdVP7ROYKZyMl9ABNeXYea48ATKMMY8jEe06di9IBck4n2EL978mm76zGrR88loc2Y
         gN2MXZuSD/P+XQfWrUoZVnvYoDJlCHFsvdalmu6zTQKXShWH15I5ushAqj88Wa/5BxBI
         cEEnfkUsCxJookZozxr9DfrProTaNVzJiSNanf3fGqm1py+TrZpUY+0R20DNy0fWaCfB
         /oMUTK0gJSduBNRG0RR7Rp/Nuix0JBxf0ToAnITrjuJ2kUVs2HHkGdwGoK5aJZdGiwfE
         UYCFS9PssdhrtPtISkWuTOb3z3ICH+GBir1fig2k8+GQBbJ6Dzp4HKuhTdbAEXhjoF5r
         t9yg==
X-Forwarded-Encrypted: i=1; AL+hErGDBW2W4EkzdJRcAv2J4ZbXFMsvY+7NR4CVSdO8p3rDDQ+/072ZM4/ey7g3Kqxz5K8u6Hqvfs/4EY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/+QZi9X3gYV1JwQj494z+tj2wfmcd5Oz0P/LC0/DWePr8fNyx
	d12HXVLcGuQJqUmbFAmasqQd7D4iG1CKBPuGrbrV/lUemmzovVXQpFKJmf3jydMcEdWhBgqt9SM
	YdPiCtx2OvBgXCHs=
X-Gm-Gg: AYBFou1FPFpIJcE/plmU/wauFBGfNDvfhYZKbDswQNsKswWRZpnNz2Etm2hyQ+LakF8
	wUq0MXiZtUXZ0Y8RfcXMOKI06JvC190+y+gvWuTBzBlOeez7kxRETZP4efI/eDwnGFkWf2j2u8b
	y8/1NKD3eBXvqiCCc9OC9m/qFOQ55yRNjys6OBIVnifdp8LeeR0xFXrbdrx/hd0c5H9utqfA3tV
	Hz7ptafCs/npGEaQZxrORWaYJVgjB/Bw5Uk48Y1X8TFto6kIAWYFumYwUGypNAN6VvmwNLcQs8B
	5bhbUh4IEaEVmjmMTXVnCmdauJDDQSZd7l7687IyPjhDr8e7tCN1QsXx12ok3YE7QE25+LWZeTg
	JdIXten5o0YTgAQ3E0OUi6P/R22ucKKF5svX/3sZaEJu6rwejGEf5yVTrCTbGGCvabbduTsvaAE
	h81cil75YEwnPwo81u3AYqi5VVvST9Gr25ikrJMK82Rnqb0U7E4/JTxJFtmELkX71I3w9ZxQDhe
	fNz3RtY/zOg3rtuGWV98eZIFd//6HchwqRTrFh8khGgCKjuMukSKip3Q6uvgUtnhSJE/hJPLDcb
	TOFJE7wtnBKUVNz32GYkLNYg6NiUplbRrp0y7EPLCKrV7crFnz3Qt4Y0q1sK3BhdlhUg0Rp/qry
	E4SoankbW4BWtBH+imppeld2RNscNOJXYaMMCnDfK9Hec1nnhCtvL4krQRBkYWPsNXeFH+6lNhg
	CoY3EMwRePhkxls9IorEhxqTEfyR5rKencWroz7197dqRtrPUvcMyy
X-Received: by 2002:a05:600c:a00d:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4ba093acadfmr26469595e9.34.1794383624548;
        Tue, 10 Nov 2026 23:53:44 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm138135715e9.15.2026.11.10.23.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:53:44 -0800 (PST)
Date: Tue, 10 Nov 2026 23:53:41 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 8/9] liveupdate: Expose the sequence number for consecutive
 live updates
Message-ID: <6f10302874805eccc3960531194c989cdd1588c4.1794383544.git.chris@chrisdown.name>
References: <cover.1794383544.git.chris@chrisdown.name>
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
In-Reply-To: <cover.1794383544.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Export LUO's live update sequence number, so that fleet monitoring can
compare hosts on their first live update with hosts that have been
through several.

We want this because some bugs, like memory corruption, may only show up
after several live updates in a row.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 Documentation/ABI/testing/sysfs-class-misc-liveupdate | 9 +++++++++
 Documentation/userspace-api/liveupdate.rst            | 1 +
 kernel/liveupdate/luo_core.c                          | 8 ++++++++
 3 files changed, 18 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-misc-liveupdate b/Documentation/ABI/testing/sysfs-class-misc-liveupdate
index 608f788ef0fa..b0ba0f626793 100644
--- a/Documentation/ABI/testing/sysfs-class-misc-liveupdate
+++ b/Documentation/ABI/testing/sysfs-class-misc-liveupdate
@@ -24,6 +24,15 @@ Description:	read only
 		the underlying KHO handover.
 Users:		system monitoring
 
+What:		/sys/class/misc/liveupdate/incoming/liveupdate_num
+Date:		Nov 2026
+Contact:	kexec@lists.infradead.org
+Description:	read only
+		LUO sequence number passed by the previous kernel. Reads 0
+		if no LUO state was handed over, 1 after the first live
+		update in a sequence, and increments with each update.
+Users:		system monitoring
+
 What:		/sys/class/misc/liveupdate/incoming/sessions
 What:		/sys/class/misc/liveupdate/incoming/files
 Date:		Nov 2026
diff --git a/Documentation/userspace-api/liveupdate.rst b/Documentation/userspace-api/liveupdate.rst
index 39bbb91d0dd4..61c246371200 100644
--- a/Documentation/userspace-api/liveupdate.rst
+++ b/Documentation/userspace-api/liveupdate.rst
@@ -50,6 +50,7 @@ Monitoring
 
 Read ``/sys/class/misc/liveupdate/incoming/`` to monitor incoming
 sessions and file retrievals without opening ``/dev/liveupdate``.
+``liveupdate_num`` gives the LUO sequence number for the current boot.
 See Documentation/ABI/testing/sysfs-class-misc-liveupdate for the sysfs ABI.
 
 See Also
diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
index ba174e9aae03..3ca7b3875247 100644
--- a/kernel/liveupdate/luo_core.c
+++ b/kernel/liveupdate/luo_core.c
@@ -441,6 +441,13 @@ static ssize_t state_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RO(state);
 
+static ssize_t liveupdate_num_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", luo_global.liveupdate_num);
+}
+static DEVICE_ATTR_RO(liveupdate_num);
+
 #define LUO_INCOMING_ATTR_RO(_name)					\
 static ssize_t _name##_show(struct device *dev,				\
 			    struct device_attribute *attr, char *buf)	\
@@ -458,6 +465,7 @@ LUO_INCOMING_ATTR_RO(files_dropped);
 
 static struct attribute *luo_incoming_attrs[] = {
 	&dev_attr_state.attr,
+	&dev_attr_liveupdate_num.attr,
 	&dev_attr_sessions.attr,
 	&dev_attr_files.attr,
 	&dev_attr_files_retrieved.attr,
-- 
2.54.0

