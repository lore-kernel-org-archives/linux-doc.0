Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD58395DBC
	for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 19:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776367516; cv=pass; b=DGulKTE68cozsxzB9lRtF8iNzu54m1wIvTQcvEIhAvUujHt7TydWkw8/LhXCgin6ZXNBAVdpZuCZH+6J94XeEfuTKjQjALLqWChVHlL1SgovfKskVnyrVVaizuhIKeAUCkbKA5jVInPP5dvPwGW4eSK4U2sZjBFZQKzArpOy4LY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776367516; c=relaxed/simple;
	bh=YTWAuUgodP4x0SGZZNXpfJHoOQ/Al8dOyWsalMJbeKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZbBUHIn+wJVxMkysE7WzxYZVoOb0mJ40Jg8AMTk8HSjKhxnk77vEXMqVmlBM26I/WtrjBt+Ka9LPeYRE+wg6ykQlK0E+xML/FT+m1zs5wcQx0HuMZe0fTTbewl0vnHiCh9pFGWR2SfsMW9+L/Wy9heihX6De/wta/51kNysJ+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IuvgudHs; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IuvgudHs"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9c755b2cdeso1366092266b.2
        for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 12:25:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776367496; cv=none;
        d=google.com; s=arc-20240605;
        b=lnU4ifKQ+F3U+qt+D3NcRiAefmNGzUfkPFHJsJB9sb5no9gP7dFxCTLcRFcZMUF14Q
         mNUturF7Kb6Nz6TTU/ePOOY0jfxDX+IN1sMBHCZ+J+x6lp8Hkkw6hkxsy+7FdLxN3MAv
         rDhZFaHzki3MQCOf6dxpKFtE+pel0elDrRQ/zPE9/Pgcld9EFVqFmXLaUMWFityBIcW1
         Bz63jhwywf74bU2UyV/x/CPPLOBiLBM960dEWv66e5f9BBZM4/MEGMzo4jWkHL2akk1M
         YSBGo9dYwLPS5Aj6BeRTVGqv3sLlgc3fG/3vRdVjV4rhIxFTh1zeNsCvE/pXIu1xiUZT
         Tqhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9K3ysuZXV4OKgvP6Hz+tr/FztQIKDGUmUgbaHLYQ4fs=;
        fh=sOq365KkCwi8SiuHGMM9qeGCiQwgA1LLLUaTSqzLR2E=;
        b=kYbr2rOUi6qyhmzY4PIbJh5YQ9ldXXp8QllLtjBKQu8lYP1I1BAMdcft1bTCqHWnSx
         OeOdxS/scFDYr6Rr7lwBFoTYWI0+ewVn7hQc6jk8tKV6KKGz/ZgUr578DWX1rc2hIbT1
         OyEG4V8LIlA27NVx6IuxaWpGtlUAGi3NCOUFx0YH8AA2pfkP+TkySl8792iEuHyd5hon
         uiE1ylwglI37WMSg9F694jJQBOwq7PUVgX8NToluEzBAEIzEDpF7q7hJEprrS9ewAd04
         7xDx8lWpX6LrRdpYt8nI3BEYDH0bfzPFtjwk7Ns6kvQYJtsVdv82vyYhb/RcLJ70I60F
         rDkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776367496; x=1776972296; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9K3ysuZXV4OKgvP6Hz+tr/FztQIKDGUmUgbaHLYQ4fs=;
        b=IuvgudHss3pf9xta9CoHzbNM/KkqwvVlbZG1ujAPlUvsEERquMRMCcNKuZB4ePTAM5
         7NtHkTfv5kJNgOXozHtBzx6BeOftPECAFzrLC/Kx+7C6Z+aMX16BAnXG4S26OUfk3WGg
         CWZQvHirIm8BMV/eAS7dQVd+snAopqjN+dWq8LBfZchgH0SFAJBxKZ7twV1lroXi7RqL
         6seCdSS2mS6a+aqyWvZotzTjBpSsVqzQV/ddt5/cyYwOEsyfwdY8ZTvZnZXvtx6xF+FO
         5LV2B5eGbqXEDNgAZKrrj0OIGOZ6Vfb9iUPXy8OI0AkX/Cx2xeQJhF/vFCWfKeI7U4O9
         g8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776367496; x=1776972296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9K3ysuZXV4OKgvP6Hz+tr/FztQIKDGUmUgbaHLYQ4fs=;
        b=A5vPtF2dQoyEDJCW7KlxaahFNFQg9roSZ5WjUiNGo3rjXewsLdNISr2qNMLCpWpbCm
         cv8hrYz922/rGCNx8WzBGWtsEphVMr7fk4ql8COzJonalIw8hS1W6grlgzIBC//43Iml
         RQ66xhfMqqo8zp5mUo6wsfajq4aVTvPvoKE2DQUtSpUQMpsBBRLYMeNNFohKGBozrzew
         VLhxuKp1Ko718z0XEWlen6qrD+84HLZJeBQumtWNC4/NupbuebdgjI8xxDmGNcQQxoAf
         1NCSugqsabeZZ3J7rnKbQyBBixDVL7Q8OcWx5sjp0560lapW1TV9wrcPHtjKHlO6KCeq
         9JDw==
X-Forwarded-Encrypted: i=1; AFNElJ8JvPqawCm7BnXw+nh8olRtFP+3FcWIEiy/DD6EuRfO1gelhMt21JgarBKEJE5mbqMyJwFMZjhTYWs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+3E5NhKWUyegdDXNCYLY0LWqH6laV/Y6Wcy36nlDWTDVdgP4a
	bzsN013Jr7bofHdKd1u0jkR3h6TjJV+la/c7Q8IOsEeBfBRVUn0z4cmVcdFea8tkwJvJn7+ykM0
	aGBxGtgIFK4x74d27ysJCi4yJn7QRluU=
X-Gm-Gg: AeBDietGj+BbgsORJFBx8B3KYsgRcXnp2wQsmvdbG74rbpNmnGQOaSYO73PtvQdZ/UY
	vpMT+cqCi6OCCGpyLe6hOMuKJFeMlHabOHeOL0/4pbKmhKNEaHR8QIGEH8w3d0aWieHIg8SCiDy
	xZ9V6aAdXlfKjoGz4/gDraSAAYaB99+Fi8vsyl4VA2PXGfMQ1hVDMkO0NjPLvtNbcemvHXnz7RF
	1QJnPwTudYWG3JwddyMIQC63LGYeQ4oZ/c58W09pGzC+6txD5osRETbnxr7coOONH4jX4yKF5h1
	9j5f9A/0crLoJG7WnQlMDZddi2QkBevKk+Dm4oz0RWyUmvmxd37CdzAOwBvdCn4=
X-Received: by 2002:a17:907:c002:b0:b9c:34f8:b969 with SMTP id
 a640c23a62f3a-ba3dd6a4727mr34562766b.49.1776367495571; Thu, 16 Apr 2026
 12:24:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416-dir-deleg-v2-0-851426a550f6@kernel.org> <20260416-dir-deleg-v2-7-851426a550f6@kernel.org>
In-Reply-To: <20260416-dir-deleg-v2-7-851426a550f6@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 16 Apr 2026 21:24:44 +0200
X-Gm-Features: AQROBzDkNbo1A8vs3cuxkYPYXRSUZziZymY7H6-6on9ynU_2C3mPiqqxTu3HE2k
Message-ID: <CAOQ4uxg2jHxCi77A1DGtopjZHsTNg4etdboW2GjL85N3uc_KqQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/28] fsnotify: add FSNOTIFY_EVENT_RENAME data type
To: Jeff Layton <jlayton@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Chuck Lever <chuck.lever@oracle.com>, Alexander Aring <alex.aring@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, NeilBrown <neil@brown.name>, 
	Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Calum Mackay <calum.mackay@oracle.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-nfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 7:35=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> Add a new fsnotify_rename_data struct and FSNOTIFY_EVENT_RENAME data
> type that carries both the moved dentry and the inode that was
> overwritten by the rename (if any).
>
> Update fsnotify_data_inode(), fsnotify_data_dentry(), and
> fsnotify_data_sb() to handle the new type, and add a new
> fsnotify_data_rename_target() helper for extracting the overwritten
> target inode.
>
> Update fsnotify_move() to use the new data type for FS_RENAME and
> FS_MOVED_TO events, passing the overwritten target inode through the
> event data. FS_MOVED_FROM is unchanged since the source directory
> doesn't need overwrite information.
>
> This is done so that fsnotify consumers like nfsd can atomically
> observe the overwritten file when a rename replaces an existing entry,
> without needing a separate FS_DELETE event.
>
> Assisted-by: Claude (Anthropic Claude Code)
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  include/linux/fsnotify.h         |  8 ++++++--
>  include/linux/fsnotify_backend.h | 20 ++++++++++++++++++++
>  2 files changed, 26 insertions(+), 2 deletions(-)

It is strange to me that the NFS protocol needs to report the overwritten
node in the same event of the rename, but oh well, fine by me.

Feel free to add:
Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks,
Amir.

>
> diff --git a/include/linux/fsnotify.h b/include/linux/fsnotify.h
> index 079c18bcdbde..bda798bc67bc 100644
> --- a/include/linux/fsnotify.h
> +++ b/include/linux/fsnotify.h
> @@ -257,6 +257,10 @@ static inline void fsnotify_move(struct inode *old_d=
ir, struct inode *new_dir,
>         __u32 new_dir_mask =3D FS_MOVED_TO;
>         __u32 rename_mask =3D FS_RENAME;
>         const struct qstr *new_name =3D &moved->d_name;
> +       struct fsnotify_rename_data rd =3D {
> +               .moved =3D moved,
> +               .target =3D target,
> +       };
>
>         if (isdir) {
>                 old_dir_mask |=3D FS_ISDIR;
> @@ -265,12 +269,12 @@ static inline void fsnotify_move(struct inode *old_=
dir, struct inode *new_dir,
>         }
>
>         /* Event with information about both old and new parent+name */
> -       fsnotify_name(rename_mask, moved, FSNOTIFY_EVENT_DENTRY,
> +       fsnotify_name(rename_mask, &rd, FSNOTIFY_EVENT_RENAME,
>                       old_dir, old_name, 0);
>
>         fsnotify_name(old_dir_mask, source, FSNOTIFY_EVENT_INODE,
>                       old_dir, old_name, fs_cookie);
> -       fsnotify_name(new_dir_mask, source, FSNOTIFY_EVENT_INODE,
> +       fsnotify_name(new_dir_mask, &rd, FSNOTIFY_EVENT_RENAME,
>                       new_dir, new_name, fs_cookie);
>
>         if (target)
> diff --git a/include/linux/fsnotify_backend.h b/include/linux/fsnotify_ba=
ckend.h
> index 66e185bd1b1b..f8c8fb7f34ae 100644
> --- a/include/linux/fsnotify_backend.h
> +++ b/include/linux/fsnotify_backend.h
> @@ -311,6 +311,7 @@ enum fsnotify_data_type {
>         FSNOTIFY_EVENT_DENTRY,
>         FSNOTIFY_EVENT_MNT,
>         FSNOTIFY_EVENT_ERROR,
> +       FSNOTIFY_EVENT_RENAME,
>  };
>
>  struct fs_error_report {
> @@ -335,6 +336,11 @@ struct fsnotify_mnt {
>         u64 mnt_id;
>  };
>
> +struct fsnotify_rename_data {
> +       struct dentry *moved;   /* the dentry that was renamed */
> +       struct inode *target;   /* inode overwritten by rename, or NULL *=
/
> +};
> +
>  static inline struct inode *fsnotify_data_inode(const void *data, int da=
ta_type)
>  {
>         switch (data_type) {
> @@ -348,6 +354,8 @@ static inline struct inode *fsnotify_data_inode(const=
 void *data, int data_type)
>                 return d_inode(file_range_path(data)->dentry);
>         case FSNOTIFY_EVENT_ERROR:
>                 return ((struct fs_error_report *)data)->inode;
> +       case FSNOTIFY_EVENT_RENAME:
> +               return d_inode(((const struct fsnotify_rename_data *)data=
)->moved);
>         default:
>                 return NULL;
>         }
> @@ -363,6 +371,8 @@ static inline struct dentry *fsnotify_data_dentry(con=
st void *data, int data_typ
>                 return ((const struct path *)data)->dentry;
>         case FSNOTIFY_EVENT_FILE_RANGE:
>                 return file_range_path(data)->dentry;
> +       case FSNOTIFY_EVENT_RENAME:
> +               return ((struct fsnotify_rename_data *)data)->moved;
>         default:
>                 return NULL;
>         }
> @@ -395,6 +405,8 @@ static inline struct super_block *fsnotify_data_sb(co=
nst void *data,
>                 return file_range_path(data)->dentry->d_sb;
>         case FSNOTIFY_EVENT_ERROR:
>                 return ((struct fs_error_report *) data)->sb;
> +       case FSNOTIFY_EVENT_RENAME:
> +               return ((const struct fsnotify_rename_data *)data)->moved=
->d_sb;
>         default:
>                 return NULL;
>         }
> @@ -430,6 +442,14 @@ static inline struct fs_error_report *fsnotify_data_=
error_report(
>         }
>  }
>
> +static inline struct inode *fsnotify_data_rename_target(const void *data=
,
> +                                                       int data_type)
> +{
> +       if (data_type =3D=3D FSNOTIFY_EVENT_RENAME)
> +               return ((const struct fsnotify_rename_data *)data)->targe=
t;
> +       return NULL;
> +}
> +
>  static inline const struct file_range *fsnotify_data_file_range(
>                                                         const void *data,
>                                                         int data_type)
>
> --
> 2.53.0
>
