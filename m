Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D719456E0A
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 13:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789566374; cv=none; b=FaCtwWNs42TQw/41WpAPYiREWbxOrcRysy407XBBvVuL9MPbCfLY01sOj099r3pEhERCRpmwOpEb8UUOsihKqUHNMvzPKumzWpX7l2hhxxMRoA4kKYZjrmNB2z7zMqcEhojkCVB5Qr9fa9m2q9Oktdl4wHj9DVRyYF3ng7TcgDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789566374; c=relaxed/simple;
	bh=JALK3ZEku02fNrcK0g+Xt9SkUYhgHph+GtKulp/52dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROdcX8RtRbir9GTouXxkqbZV+torjFsEFleZXJg21vKklKndAk/diJj3ug7drDTuUFViTk7ZI6YzCLgO2eAzhExk26YscfbiV11sbKJKfLrP/jYJ+i6DbahkjJWeJSF1f/pFOKrpX93Pt+/1TazJtEVz4ZR0KGuwTgMCotWPGXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YsOFx69y; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YsOFx69y"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056be4d1so786274a12.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 06:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789566360; x=1790171160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gS5Urd2oK4cUSLkPyZ8kKu9K7ELV+4PGRJOBXjNcmpA=;
        b=YsOFx69y7zAipESFJmWnXl5Qsecs6gbqqymCvBwbAffX1r7WUk2XoG9UV5OeGcdJS7
         oY8dT33LmXSRivEuiPuE90x3qkMTNT4snxg99+QY2kNliPjLeTcRfFRc5i1+KOfc7hJC
         YNNy0D2jFfy4FXWdrULVxRAUrK9Flp3IIJ1CvktvnThhUnYJatNrT4Mao+QLLPEudlyg
         TKmhGPdWEuZ8+1Z4fMxr0ETGrjov+JlRONzb3FHkJY22vE8yGjVXGXT3Qyz1htKCNhBx
         Vzsn8yYSbucMSkgOihttNqkVtVt1nitbTDQ55RLrbAGE6YTed9QnK4/KmnTY/xrTTikC
         mZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789566360; x=1790171160;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gS5Urd2oK4cUSLkPyZ8kKu9K7ELV+4PGRJOBXjNcmpA=;
        b=eXAyM//iDKugtmTgidmT/qcBkwEs9K43YJU23uYGlcW0FtkmFqOz+R4HGQpWltAHVq
         +e0YtfGC2DNGsx822vyR0FXFBNh3ZNY35pfp9BWw4dtWNqgLx3E4uJXnaX6jtIX5ssO/
         74ruaR+Ia3KTnqyda6MY6vHp1EwjSYitISiLS10PB3tF/OE0l7MjeCgJYvhRhLB8vSGF
         8NDMV8YgnBqACmnM7aCnG1+3sk8Vs3+sqk7+Xi+YlRGztjv4cXIbPIpDujlRmnGD1MuR
         hGUl0LyG7GvNRGS+m1Yh9LToyu5HI1WxXAlLd2xin8s5OKzHVgukgqBlz5e9Yj8lp14V
         fPeg==
X-Forwarded-Encrypted: i=1; AKwUvByuvqiEXhlimyVaAZiSlim2BQsosWTnbubpxxJPccQ1CNNbOYLLeDUO0eNpdT1AfJ0ICKu8fzIbLPg=@vger.kernel.org
X-Gm-Message-State: AFuF++mjzzvZyHQX3fzoMOIHpnoFX6+ZPfzakOUld4gmvbg84IgDQAqi
	BPSrrhVqD2L4KlZH7FmKErKhkHS9vD1GoGLdlzl+PbkQNCvJJEdnLlyHA2P6t45hE+g=
X-Gm-Gg: AYBFou3ROkIP4jIo6/7hYBENo4zCLgmHyFceBEOhle7JnDQ7vTKKoAg5becnrhHBrqh
	Afnhh8cJqlxZIh0Up0tOUQ/ISKBYTcpwd/X4VPszTUmojAl71vPTGXXc48xhZAgqS+zrwGEs1O9
	BCAXdcMYJljL385EkIDW9xTB1UMf0m0Oj/YDvPPdQupjq9bXgheiMB/S/LENoEPQ5TWEbLC5mtE
	ovIRBRek0x6NCPyQTEk5lOBv1aeQH9pfuykCTOpvfuRChJSWj9XjCwhBfWQ6hK08bMR3M31hX1s
	cKVAB6PAwVarw4BIDU3ZQjiPGpefz68npqHstTmVukUAi+0XvHz9MsfXZN4v4nr8vGZ/PN3yZ2x
	aWdFjsQ+duICZrVkQSKqVwIJZ+0frHTMqt/3IUFFQxrRm4OGlfVmklMIcbjQar0VYFUgF2Ts2yK
	eZOJVKbp3yqupyrp7Qp0nq2DMNBtYOaoGe3/RM3xPWbGnHVgXBgZ/eOnxbkEQP
X-Received: by 2002:a05:6402:52d9:b0:6a9:9840:f3d with SMTP id 4fb4d7f45d1cf-6aa2288f30amr2016738a12.4.1789566359636;
        Wed, 16 Sep 2026 06:45:59 -0700 (PDT)
Received: from localhost ([2a02:aa7:4656:2314:c23c:9eda:81d:3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1cfe07e4sm1792644a12.2.2026.09.16.06.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:45:59 -0700 (PDT)
Date: Wed, 16 Sep 2026 15:45:58 +0200
From: Michal Hocko <mhocko@suse.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kyle Meyer <kyle.meyer@hpe.com>, akpm@linux-foundation.org,
	corbet@lwn.net, linmiaohe@huawei.com, shuah@kernel.org,
	tony.luck@intel.com, jane.chu@oracle.com, jiaqiyan@google.com,
	Liam.Howlett@oracle.com, bp@alien8.de, hannes@cmpxchg.org,
	jack@suse.cz, joel.granados@kernel.org, laoar.shao@gmail.com,
	lorenzo.stoakes@oracle.com, mclapinski@google.com,
	nao.horiguchi@gmail.com, osalvador@suse.de,
	rafael.j.wysocki@intel.com, rppt@kernel.org, russ.anderson@hpe.com,
	shawn.fan@intel.com, surenb@google.com, vbabka@suse.cz,
	linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3] mm/memory-failure: Support disabling soft offline for
 HugeTLB pages
Message-ID: <aqqdlndHq9vHeX8s@tiehlicka>
References: <aqiIEkrc6aDBOqRg@hpe.com>
 <aqkCbgHmMGxI_GLG@tiehlicka>
 <aqmGd0GGUCkbZpkZ@hpe.com>
 <aqpYxAktjexhaMGc@tiehlicka>
 <ad36cd54-7319-4bb4-bf8f-9fcc7b009158@kernel.org>
 <aqqXbwglwYTyTuUG@tiehlicka>
 <36480c86-fc59-4387-91a4-cad839f502f2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36480c86-fc59-4387-91a4-cad839f502f2@kernel.org>

On Wed 16-09-26 15:28:01, David Hildenbrand wrote:
> On 9/16/26 15:19, Michal Hocko wrote:
> > On Wed 16-09-26 15:08:45, David Hildenbrand wrote:
> >>
> >>>
> >>> OK, so apparently there are some BIOSes which abuse this feature to
> >>> mimic a real HW poisoning. This doesn't change the overall picture
> >>> though
> >>
> >> Is this really abusing? We know that a page is shaky and will likely go bad in
> >> the future, For now it is still accessible. Trying to migrate off that page stop
> >> using it right away sounds pretty logical to me.
> > 
> > Yes, no dispute on that. But we have HW poisoning for exactly that
> > purpose, no?
> 
> Well, that tells you that the page content is effectively gone and should be
> tried to be recovered / migrated away. Unless I am messing up terminology here.

Maybe it is me messing up the terminology...
But I guess we have established that whether soft offlining is being
abused or not, excluding hugetlb through a configuration is just a wrong
thing to do.
-- 
Michal Hocko
SUSE Labs
